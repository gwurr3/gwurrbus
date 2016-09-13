#!/usr/bin/env perl
#
# Copyright (c) 2015, 2016 Glenn Wurr III <glenn@wurr.net>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

use strict;
use warnings;

use Sys::Syslog qw(:standard :macros);
use IO::Socket::UNIX;
use IO::Socket::INET;
use IO::Select;
#use Time::HiRes qw( usleep nanosleep );
use JSON qw( encode_json decode_json );

my $bindaddy = "10.0.0.1";
my $bindport = "9001";


my $outsocket_path = "/var/run/rs485/in.sock";
my $insocket_path = "/var/run/rs485/out.sock";

my $outsocket = IO::Socket::UNIX->new(
	Type => SOCK_STREAM(),
	Peer => $outsocket_path,
	);
unless ($outsocket) {
	syslog(LOG_WARNING, "Could not connect to serial input socket! $!");
	die ;
}

my $outsel = IO::Select->new($outsocket) ;
unless ($outsel) {
	syslog(LOG_WARNING, "Could not connect to serial input socket! $!");
	die ;
}

my $insocket = IO::Socket::UNIX->new(
	Type => SOCK_STREAM(),
	Peer => $insocket_path,
	Blocking => 1,
	);
unless ($insocket) {
	syslog(LOG_WARNING, "Could not connect to serial output socket! $!");
	die ;
}

my $insel = IO::Select->new($insocket) ;
unless ($insel) {
	syslog(LOG_WARNING, "Could not connect to serial output socket! $!");
	die ;
}

my $server = new IO::Socket::INET (
	LocalHost => "$bindaddy",
	LocalPort => "$bindport",
	Proto => 'tcp',
	Listen => 5,
	Reuse => 1
	);
unless ($server) {
	syslog(LOG_WARNING, "Could not bind to $bindaddy : $bindport $!");
	die ;
}


syslog(LOG_DAEMON, "rs485requesthandler started and running");

while(1) {
	#get connection from a client
	my $client = $server->accept();
	my $clientaddy = $client->peerhost();

	my $data = "";
	$client->recv($data, 1024);
	my $rs485packet = decode_request(\$data);
	if ($rs485packet) {

		if ($outsel->can_write(2)) {
			$outsocket->send($rs485packet);
			#usleep(100000);
			if ($insel->can_read(2)) {
				#sysread( $insocket , my $rs485data, 1024);
				my $maxread = 300;
				my $rs485data ;
				while ( $insel->can_read(0.01) && $maxread-- ) {
					$insocket->recv( my $eightbytes, 8);
					$rs485data .= $eightbytes;
				}
				$insocket->flush;
				my $toclient = encode_packet_response(\$rs485data);
				if ($toclient) {
					$client->send($toclient);
				} else {
					$client->send( encode_error("Malformed data from controller") );
				}
				$insocket->flush;
			} else {
				$client->send( encode_error("Controller Timeout") );
			}
		} else {
			$client->send( encode_error("CRITICAL ERROR: could not send rs485 data") );
			syslog(LOG_WARNING, "Critical error sending rs485 data!");
		}
	} else {
		$client->send( encode_error("MALFORMED JSON PAYLOAD") );
	}

	shutdown($client, 1);
}

$server->close();
$outsocket->close();
$insocket->close();


sub encode_error
{
	my $message = shift;
	my %hash = (
		'status' => "ERROR",
		'data' => {
				'reply' => "$message",
		},
	);
	return encode_json(\%hash);

}

sub encode_packet_response
{
	my $dataref = shift;
	my $addy = substr $$dataref, 0, 3 ; #NOTE: as of now the micros are spitting back a numerical address. need to change this back to a single byte
	my $command = substr $$dataref, 4, 8 ;
	my $reply = substr $$dataref, 13 ;
	chomp $command;
	$command =~ s/^\s+|\s+$//g ;
	chomp $reply;
	$reply =~ s/\R//g;
	$reply =~ s/^\s+|\s+$//g ;
	return unless ( $addy && $command ) ;
	my %hash = (
		'status' => "OK",
		'data' => {
				'address' => "$addy",
				'command' => "$command",
				'reply' => "$reply",
		},
	);
	return encode_json(\%hash);
}


sub decode_request
{
	my $dataref = shift;
	my $request = decode_json($$dataref);
	return unless $request;
	my $addy = $request->{'address'};
	my $command = $request->{'command'};
	my $commandlen = length $command;
	my $arguments = $request->{'arguments'};
	if ( $addy > 255 || $addy < 128 || $commandlen > 8 || $commandlen < 1 || length $arguments > 244 ) {
		return;
	}
	# packet needs to look like this:  "<address>:PING    :TROLOLOLOLOLOLO This is an argument\n" 
	my @stringdata ;
	my @commanddata = split( '', $command);
	$stringdata[0] = chr($addy);
	$stringdata[1] = ':';
	my $count = 0;
	my $loc = 2;
	while ( $count < $commandlen ) {
		$stringdata[$loc] = $commanddata[$count];
		$loc = $loc + 1;
		$count = $count + 1;
	}
	while ( $loc < 10 ) {
		$stringdata[$loc] = ' ';
		$loc = $loc + 1;
	}

	$stringdata[10] = ':';
	my $string = join( '', @stringdata );
	$string .= $arguments if $arguments;
	$string .= "\n\0";
	#print $string;
	return $string;

}
