/* 
 * the basis for the rs485 stuff is stolen from https://github.com/kohyama/AVR-RS485
 * Copyright (c) 2011, Yoshinori Kohyama (http://algobit.jp/)
 * Was under a one-clause BSD license ( only source code, nothing about binary format )
 * So it's compatible with any BSD/MIT/etc licesne
 */
/*
 * Copyright (c) 2011, Yoshinori Kohyama (http://algobit.jp/)
 * Copyright (c) 2015, 2016 Glenn Wurr III <glenn@wurr.net>
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */



#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include <stdlib.h>

#define NODATA 256

// TODO: Make this portable to other AVRs with some ifdef shit


static volatile struct {
	char *buf;
	unsigned char size;
	unsigned char read;
	unsigned char write;
} rs485_rx, rs485_tx;

static void rs485_init(void)
{
#if defined (__AVR_ATmega328P__)
	rs485_rx.size = 255;
	rs485_tx.size = 255;
#elif defined (__AVR_ATtiny2313__)
	rs485_rx.size = 32;
	rs485_tx.size = 32;
#endif

	rs485_rx.buf = (char *)malloc(rs485_rx.size * sizeof(char));
	rs485_rx.read = 0;
	rs485_rx.write = 0;

	rs485_tx.buf = (char *)malloc(rs485_tx.size * sizeof(char));
	rs485_tx.read = 0;
	rs485_tx.write = 0;


#if defined (__AVR_ATmega328P__)
	DDRD |= 0x04; // PD2:Dir
	PORTD &= ~0x04; // start in RX mode
	_delay_us(500);

	// checkout http://wormfood.net/avrbaudcalc.php
	//UBRR0 = 12; // 38400bps under CPU 8MHz
	//UBRR0 = 25; // 38400bps under CPU 16MHz
	UBRR0 = 103; // 9600bps under CPU 16MHz
	//UBRR0 = 3332; // 300bps under CPU 16MHz
	//UBRR0 = 832; // 1200bps under CPU 16MHz
	UCSR0A = 0;
	UCSR0B = _BV(RXCIE0)|_BV(RXEN0)|_BV(TXEN0);
	UCSR0C = _BV(UCSZ01)|_BV(UCSZ00);
#elif defined (__AVR_ATtiny2313__)
	DDRD |= 0x04; // PD2:Dir
	PORTD &= ~0x04; // start in RX mode
	_delay_us(500);
	UBRRH = 0x00;
	UBRRL = 0x67;
	UCSRA = 0;
	UCSRB = _BV(RXCIE)|_BV(RXEN)|_BV(TXEN);
	UCSRC = _BV(UCSZ1)|_BV(UCSZ0);
#endif
}

static void rs485_clear(void)
{
	cli();
	memset(rs485_rx.buf, 0, rs485_rx.size);
	memset(rs485_tx.buf, 0, rs485_tx.size);
	rs485_rx.read = 0;
	rs485_rx.write = 0;
	rs485_tx.read = 0;
	rs485_tx.write = 0;
	sei();
}

static void rs485_send(char *p)
{
	unsigned char next;

	if (*p == '\0')
		return;

	cli();
	next = (rs485_tx.write + 1)%rs485_tx.size;
	while (next != rs485_tx.read && *p != '\0') { //while there is still data or haven't reached EOL
		rs485_tx.buf[rs485_tx.write] = *p++; //put char into buffer
		rs485_tx.write = next;
		next = (rs485_tx.write + 1)%rs485_tx.size;
	}
#if defined (__AVR_ATmega328P__)
	PORTD |= 0x04; // set TX mode on MAX485 to on
	_delay_us(500); // wait for MAX485 to turn on
	UCSR0B |= _BV(UDRIE0); // enable TX interrupt
#elif defined (__AVR_ATtiny2313__)
	PORTD |= 0x04; // set TX mode on MAX485 to on
	_delay_us(500); // wait for MAX485 to turn on
	UCSRB |= _BV(UDRIE); // enable TX interrupt
#endif
	sei(); //re-enable interrupts so USART_UDRE_vect will fire

	while (rs485_tx.write != rs485_tx.read  ) //block, until buffer has been sent
		_delay_us(500); 
}

/* not using this at the moment
static int rs485_readln(char *buf, int size)
{
	int n = 0;

	do {
		cli();
		while (rs485_rx.read != rs485_rx.write && n + 1 < size) { //while read buffer still has data or we hit max size
			buf[n++] = rs485_rx.buf[rs485_rx.read]; //shove char into arg buffer
			rs485_rx.read = (rs485_rx.read + 1)%rs485_rx.size; //counter
		}
		sei();
	} while (n == 0 || buf[n - 1] != 0x0a ); // repeat until we hit a newline char 

	buf[n] = '\0'; // set last char to null terminator

	return n;
}

*/

static unsigned int rs485_readc(void)
{
	unsigned char data;


	if (rs485_rx.read == rs485_rx.write ) { //if nothing to read from buffer
		return NODATA;
	}

	data =  rs485_rx.buf[rs485_rx.read];
	rs485_rx.read = (rs485_rx.read + 1)%rs485_rx.size;

	return data;

}



ISR(USART_RX_vect)
{
	unsigned char next;

	cli();
	next = (rs485_rx.write + 1)%rs485_rx.size; // update counter
#if defined (__AVR_ATmega328P__)
	rs485_rx.buf[rs485_rx.write] = UDR0; //read a char into buffer
#elif defined (__AVR_ATtiny2313__)
	rs485_rx.buf[rs485_rx.write] = UDR; //read a char into buffer
#endif
	if (next != rs485_rx.read)
		rs485_rx.write = next;
	sei();
}

ISR(USART_UDRE_vect)
{
	cli();
	if (rs485_tx.read == rs485_tx.write) { // if buffer empty
		_delay_us(5000); // without this the last char often gets cut off short
		// could be cutting of max485 right as it's in transit. 16mhz is pretty fast...
#if defined (__AVR_ATmega328P__)
		UCSR0B &= ~_BV(UDRIE0); // disable transmit interrupt
		PORTD &= ~0x04; // turn off TX mode on MAX485
#elif defined (__AVR_ATtiny2313__)
		UCSRB &= ~_BV(UDRIE); // disable transmit interrupt
		PORTD &= ~0x04; // turn off TX mode on MAX485
#endif
		_delay_us(500); // give MAX485 some time to change modes

	} else { // buffer not empty, we're sending
#if defined (__AVR_ATmega328P__)
		UDR0 = rs485_tx.buf[rs485_tx.read]; // send a char
#elif defined (__AVR_ATtiny2313__)
		UDR = rs485_tx.buf[rs485_tx.read]; // send a char
#endif
		rs485_tx.read = (rs485_tx.read + 1)%rs485_tx.size; // update counter
	}
	sei();
}


// protocol stuff

#if defined (__AVR_ATmega328P__)
static char data_in[254];
static char argv[243];
static char output[254];
#elif defined (__AVR_ATtiny2313__)
static char data_in[31];
static char argv[20];
static char output[31];
#endif

static unsigned char data_count = 0;
static unsigned char is_command = 0;

static char command[8];



static unsigned char do_output = 0;
static char c ;


static void copy_command (void) {
	// packet example: ID-":"-<command 8 bytes>-":"-<arguments>"
	// 
	// so in the sender program, it might look like this:
	//unsigned char wbuf[] = " :PING    :TROLOLOLOLOLOLO This is an argument \n";
	//wbuf[0] = 128; // the address byte goes in that empty whitespace in the above

	// Copy the command stuff out of data_in into command and argv
	memcpy(command, data_in+2, 8); 
#if defined (__AVR_ATmega328P__)
	memcpy(argv, data_in+11, 243); 
	memset(data_in, 0, 254); 
#elif defined (__AVR_ATtiny2313__)
	memcpy(argv, data_in+11, 20); 
	memset(data_in, 0, 31); 
#endif

}


// this is where local changes are made
#include "config.h"


void process_rs485(void){

	c = rs485_readc();
	
	if ( c & NODATA ){ // rs485_readc returns 256 if no data in ring buffer
	  	// no data available from UART 
	} else if ( c == MYADDY || is_command == 1){ // if byte is our address or if we've already recv'd our adddy
	
		is_command = 1;	
		// Add char to input buffer
		data_in[data_count] = c;
		
		// newline is signal for end of command input
		if (data_in[data_count] == '\n') {
			// Reset to 0, ready to go again
			data_count = 0;
			is_command = 0;	
			
			copy_command();
			process_command();
			// clear ring buffers for good measure
			// some noise may have occured in the time it took to run process_command.
			rs485_clear(); 
		} else {
			data_count++;
		}
		
	} else {
		//do nothing
	}
}

