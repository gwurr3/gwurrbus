/*
 * This file is where you should put your local customizations
 * the only thing that shouldn't be static are the local_* functions as they are used in main.c
 */


// use an extended ASCII code ( 128 and up ) as an address so it doesn't get confused with normal data
#define MYADDY 187



static void process_command(void)
{
  /*
   * This is where you put your code to handle commands
   */

	// some example commands
	if (strstr(command, "PING") != NULL) {
		// Please note that as we're sending the address as a numerical,
		// instead of a char, we get 2 less bytes. So if argv is full,
		// the last two bytes are gonna get chopped off on the echo back
		snprintf(output , 255 , "%d:PONG    :%s\n" , MYADDY , argv);
		do_output = 1;
	} else if (strstr(command, "SETPWM1") != NULL) {
		OCR0A = atoi(argv);
		snprintf(output , 255 , "%d:ACK     :SETPWM1 to %s\n" , MYADDY , argv);
		do_output = 1;

	} else if (strstr(command, "SETPWM2") != NULL) {
		OCR0B = atoi(argv);
		snprintf(output , 255 , "%d:ACK     :SETPWM2 to %s\n" , MYADDY , argv);
		do_output = 1;

	}


	if (do_output) {
		_delay_ms(100); // makes timing easier on PC RS485 adapter
		rs485_send(output);
  		memset(output, 0, 255); // clear output buffer for next run JIC
	}




}

void local_setup(void)
{
  /*
   * This is where you put local code to be run during boot time
   */

  // PWM on  ATmega48A/PA/88A/PA/168A/PA/328/P example
  // Port D5 and D6 as output
  DDRD   |= (1 << 6); 
  DDRD   |= (1 << 5); 
	TCCR0A = _BV(COM0A1) | _BV(COM0B1) | _BV(WGM01) | _BV(WGM00);      // Non inverting mode on OC0A and OC0B, Mode = Mode 3 FAST PWM
	TCCR0B = _BV(CS00);                                                // prescaling settings
	// default to off
	OCR0A = 0;
	OCR0B = 0;



  // THESE MUST BE HERE
	rs485_init();
	sei();
	_delay_ms(100);
  // END THESE MUST BE HERE

}

void local_main_loop(void)
{
  /*
   * This is where you put local code to be run in the while loop in main()
   * it is executed before each attempt to read and process an RS485 command.
   * can be useful for doing things like populating sensor data into variables
   */
}
