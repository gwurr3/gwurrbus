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

die "\nUSAGE: rs485client <rs485server:port> <address> <command> [arguments] \nEXAMPLE: rs485client 128 PING FOOBAR \n" unless $#ARGV == 2 or $#ARGV == 3 ;

my $address = $ARGV[1];
my $command = $ARGV[2];
my $arguments = $ARGV[3];
my $commandlen = length $command;
my $argumentslen = length $arguments;
my $rs485server;
my $rs485serverport;

if ( $ARGV[0] =~ /^((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])):(\d+)$/ ) {
	$rs485server = $1;
	$rs485serverport = $5;
} elsif ( $ARGV[0] =~ /^((([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])):(\d+)$/ ) {
	$rs485server = $1;
	$rs485serverport = $5;
} else {
	die "\nInvalid Server Address\n";
}


die "\nInvalid Address. Must use 128-255\n" unless $address =~ /^\d\d\d$/ and $address > 127 and $address < 256 ;
die "\nCommand must be 8 bytes or less\n" unless $commandlen < 9 ;
if ($arguments) {
	die "\nArgument must be 244 bytes or less\n" unless $argumentslen < 245 ;
} else {
	$arguments = " ";
}

use JSON qw( encode_json decode_json );
use IO::Socket::INET;
#use Data::Dumper;


my %hash = (
	'address' => "$address",
	'command' => "$command",
	'arguments' => "$arguments",
);

my $data = encode_json(\%hash);


my $server = new IO::Socket::INET (
	PeerHost => "$rs485server",
	PeerPort => "$rs485serverport",
	Proto => 'tcp',
);
die "Can't connect to $rs485server $!\n" unless $server;

$server->send($data);
shutdown($server, 1);

$server->recv($data, 1024);
$server->close();

my $decoded = decode_json($data);
#print Dumper($decoded);

my $status = $decoded->{'status'};
my $reply = $decoded->{'data'}{'reply'};
chomp $reply;

if ($status =~ /ERROR/) {
	print "Error: $reply \n";
} elsif ($status =~ /OK/) {
	my $from =  $decoded->{'data'}{'address'};
	my $what =  $decoded->{'data'}{'command'};
	if ($reply) {
		print "$from said: $what -> $reply \n";
	} else {
		print "$from said: $what \n";
	}
} else {
	print "Unknown data received.. \n";
}


