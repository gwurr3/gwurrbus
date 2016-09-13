#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <string.h>


#define BAUDRATE 9600

int serial;
struct termios serialConfig;



int setRTS(int fd, int level)
{
	int status;
	
	if (ioctl(fd, TIOCMGET, &status) == -1) {
		perror("setRTS(): TIOCMGET");
		return 0;
	}
	if (level)
		status |= TIOCM_RTS;
	else
		status &= ~TIOCM_RTS;
	if (ioctl(fd, TIOCMSET, &status) == -1) {
		perror("setRTS(): TIOCMSET");
		return 0;
	}
	return 1;
}



void readMode(int fd)
{
	setRTS(fd, 1);
	usleep(5000);
	tcflush(fd, TCIOFLUSH);

}

void writeMode(int fd)
{
	setRTS(fd, 0);
	usleep(5000);
	tcflush(fd, TCIOFLUSH);

}

int main( int argc, char *argv[] )
{


	if ( argc != 5 ) {
		fprintf(stderr, "Usage: %s serialport address command arguments\n\n" , argv[0] );
		return 1;
	}
	

	char serialport[64];	
	int address;
	char command[9];
	char arguments[243];
	char wbuf[255];

	strlcpy(serialport, argv[1], 64);
	address = (int)strtol(argv[2], (char **)NULL, 10);

	if ( strlen(argv[3]) <= 8 ) {
		strlcpy(command, argv[3], strlen(argv[3]) + 1);
	} else {
		fprintf(stderr, "Command given was too large. 8 bytes MAX\n\n" );
		return 1;
	}

	strlcpy(arguments, argv[4], 243);

	// packet needs to look like this:
	// "<address>:PING    :TROLOLOLOLOLOLO This is an argument \n"
	wbuf[0] = address;
	wbuf[1] = ':';
	wbuf[2] = '\0'; // do this so strlcat will know where to start from

	if ( strlen(command) < 8 ) {
		int loc = 2;
		int count = 0;
		while ( count < strlen(command) ) 
			wbuf[loc++] = command[count++]; // copy what we have of command into wbuf
		while( loc < 10 )  
			wbuf[loc++] = ' '; // fill the remaining with space char

	} else { // if it's exactly 8 chars already, no need to fill whitespace
		strlcat(wbuf, command, 11);
	}
	wbuf[10] = ':';
	wbuf[11] = '\0';
	strlcat(wbuf, arguments, 254);
	strlcat(wbuf, "\n", 255);

	// uncomment the following for debugging the above:
	//printf("address %d : command %s : arguments %s : \n" , address, command, arguments);
	//printf("\n\n whole packet:\n%s\n" , wbuf);
	//return 0;


	serial = open(serialport,O_RDWR | O_NOCTTY | O_SYNC); 
	//serial = open(SERIALPORT,O_RDWR | O_NOCTTY | O_NDELAY); 
	if (serial < 0)
	{
		fprintf(stderr, "Could not open serial port %s: %s\n",serialport, strerror(errno));
		return 1;
	}

	// BEGIN SERIAL PORT SETUP
	memset(&serialConfig,0,sizeof(serialConfig));
	cfmakeraw(&serialConfig);

	serialConfig.c_cflag = B9600;		// 9600 baud
	serialConfig.c_cflag |= CS8;		// 8n1 (8bit,no parity,1 stopbit)
	serialConfig.c_cflag |= CLOCAL;	//local connection, no modem contol
	serialConfig.c_cflag |= CREAD;	// enable receiving characters
	serialConfig.c_cflag &= ~CSTOPB;            //Clear double stop bits
	serialConfig.c_lflag = 0;
	serialConfig.c_iflag = 0;


	serialConfig.c_cc[VMIN] = 0; // block read until a char arrives
	serialConfig.c_cc[VTIME] = 0; // in deciseconds

	tcflush(serial,TCIOFLUSH);
	tcsetattr(serial,TCSANOW,&serialConfig);
	// END SERIAL PORT SETUP



	unsigned char *rbuf = calloc(255, sizeof(char) );
	int bytes;

	int writesize = strlen(wbuf);
	int writetime = (int)(((( (float)writesize * 8.0) / (float)BAUDRATE ) * 1000.0 ) * 1000.0) + 10000 + 50000 ;

	int readsize = 255;
	//                                                                                       --AVR waits 200ms-
	int readtime = (int)(((( (float)readsize * 8.0) / (float)BAUDRATE ) * 1000.0 ) * 1000.0) + (200 * 1000) ;


	// -----------------------------
	writeMode(serial);
	fprintf(stderr,"writing %d bytes:: --> %s",writesize,wbuf);
	//printf("and waiting %d \n",writetime);
	bytes = write(serial,wbuf,writesize);
	usleep(writetime);
	tcdrain(serial);


	readMode(serial);
	//printf("\n\n\nreading %d bytes \n",readsize);
	//printf("waiting %d \n",readtime);
	usleep(readtime);
	bytes = read(serial,rbuf,readsize);


	if(bytes < 1)
		fprintf(stderr, "read error %s\n read() returned %d \n",strerror(errno), bytes);
	else
		printf("%s",rbuf);


	free(rbuf);



	close(serial);
}


