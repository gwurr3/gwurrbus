/*
 * Copyright (c) 2015, 2016 Glenn Wurr III <glenn@wurr.net>
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <poll.h>
#include <pwd.h>
#include <syslog.h>
#include <stdarg.h>

#ifndef BAUDRATE
#define BAUDRATE 9600
#endif
#ifndef SOCKETIN
#define SOCKETIN "/var/run/rs485/in.sock"
#endif
#ifndef SOCKETOUT
#define SOCKETOUT "/var/run/rs485/out.sock"
#endif
#ifndef RUNDIR
#define RUNDIR "/var/run/rs485"
#endif
#ifndef USER
#define USER "rs485"
#endif

char *inputsocket_path = SOCKETIN ;
char *outputsocket_path = SOCKETOUT ;
char *rundir = RUNDIR ;
char *user = USER ;

struct termios serialConfig;
struct sockaddr_un inaddr,outaddr;
int serial,inputsocketfile,insock,outputsocketfile,outsock,pid,pid2,perlpid;
	


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
	tcflush(fd, TCIFLUSH);

}

void writeMode(int fd)
{
	setRTS(fd, 0);
	usleep(500); // give some time to allow MAX485 chip to switch modes
	tcflush(fd, TCOFLUSH);

}



int initSerial(const char *serialport)
{
	// BEGIN SERIAL PORT SETUP
	//serial = open(serialport,O_RDWR | O_NOCTTY | O_SYNC); 
	//serial = open(serialport,O_RDWR | O_NOCTTY | O_NDELAY); 
	serial = open(serialport,O_RDWR | O_NOCTTY | O_SYNC | O_NDELAY | O_NONBLOCK); 
	if (serial < 0)
	{
		fprintf(stderr, "Could not open serial port %s: %s\n",serialport, strerror(errno));
		exit(-1);
	}

	memset(&serialConfig,0,sizeof(serialConfig));
	cfmakeraw(&serialConfig);

	serialConfig.c_cflag = B9600;		// 9600 baud
	serialConfig.c_cflag |= CS8;		// 8n1 (8bit,no parity,1 stopbit)
	serialConfig.c_cflag |= CLOCAL;	//local connection, no modem contol
	serialConfig.c_cflag |= CREAD;	// enable receiving characters
	serialConfig.c_cflag |= NOFLSH; // Disable flushing of input buffers after interrupt or quit characters
	serialConfig.c_cflag &= ~CSTOPB;            //Clear double stop bits
	serialConfig.c_cflag &= ~CRTSCTS; // no hw flow control
	serialConfig.c_lflag = 0;
	serialConfig.c_oflag = 0;
	serialConfig.c_iflag = 0;
	serialConfig.c_iflag &= ~(IXON | IXOFF | IXANY); // NO flow control
	serialConfig.c_iflag |= IGNBRK; // 	Ignore break condition
	serialConfig.c_iflag |= IGNPAR; // 	Ignore parity errors


	serialConfig.c_cc[VMIN] = 0; // block read until a char arrives
	serialConfig.c_cc[VTIME] = 0; // in deciseconds

	tcflush(serial,TCIOFLUSH);
	tcsetattr(serial,TCSANOW,&serialConfig);


	readMode(serial); // default to read mode
	// END SERIAL PORT SETUP
	return serial;
}


void daemonstuff()
{

	umask(027);
	chdir(rundir);
	int i = open("/dev/null", O_RDWR);
	dup2(i, STDIN_FILENO);
	dup2(i, STDOUT_FILENO);
	dup2(i, STDERR_FILENO);
	close(i);
}

int main( int argc, char *argv[] )
{

	if ( argc != 2 ) {
		fprintf(stderr, "Usage: %s serialport \n\n" , argv[0] );
		return 1;
	}
	
	serial = initSerial(argv[1]);

	
	if (getuid() == 0) {
		/* process is running as root, drop privileges */

		struct passwd *userpw;
		userpw = getpwnam(user);
		if (setgid(userpw->pw_gid) != 0)
			perror("setgid: Unable to drop group privileges");
		if (setuid(userpw->pw_uid) != 0)
			perror("setuid: Unable to drop user privileges");
	}

	//if (pledge("stdio rpath unix tty", NULL) == -1)
	//	err(1, "pledge");

	// SOCKET INIT SHIT

	if ( (inputsocketfile = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
	  perror("socket error");
	  exit(-1);
	}
	if ( (outputsocketfile = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
	  perror("socket error");
	  exit(-1);
	}

	memset(&inaddr, 0, sizeof(inaddr));
	memset(&outaddr, 0, sizeof(outaddr));
	inaddr.sun_family = AF_UNIX;
	outaddr.sun_family = AF_UNIX;
	strncpy(inaddr.sun_path, inputsocket_path, sizeof(inaddr.sun_path)-1);
	strncpy(outaddr.sun_path, outputsocket_path, sizeof(outaddr.sun_path)-1);
	
	unlink(inputsocket_path);
	unlink(outputsocket_path);
	
	if (bind(inputsocketfile, (struct sockaddr*)&inaddr, sizeof(inaddr)) == -1) {
	  perror("bind error");
	  exit(-1);
	}
	if (bind(outputsocketfile, (struct sockaddr*)&outaddr, sizeof(outaddr)) == -1) {
	  perror("bind error");
	  exit(-1);
	}
	if (listen(inputsocketfile, 5) == -1) {
	  perror("listen error");
	  exit(-1);
	}
	if (listen(outputsocketfile, 5) == -1) {
	  perror("listen error");
	  exit(-1);
	}
	
	
	setpgid(0,0);

	pid = fork();
	pid2 = fork();
	perlpid = fork();

	if ( perlpid < 0 || pid2 < 0 || pid < 0  ) {
		fprintf(stderr,"CANT FORK\n");
		exit(-1);
	}

	if ( pid == 0 && perlpid > 0 && pid2 > 0 ) {
		// child
		daemonstuff();
		syslog(LOG_DAEMON, "rs485serialserver data poller started and running");
		char outputbuf[1];
		int bytesout,nready;
		struct pollfd pollserial[1];
		pollserial[0].fd = serial;
		pollserial[0].events = POLLIN;

		if ( (outsock = accept(outputsocketfile, NULL, NULL)) == -1) {
			  exit(-1);
		}
			

		while (1) {
			//puts("waiting for input on serial");
			nready = poll(pollserial, 1 , 5000);
			if (nready > 0) {
				//puts("input ready to be read");
				bytesout=read(serial,outputbuf,1);
				if (bytesout > 0) {
					//puts("got a char!");
					write(outsock,outputbuf,bytesout);
				}
			}

		}
		close(serial);
		exit(0);


	} else if ( pid2 == 0 && perlpid > 0 && pid > 0 ) {
		// child
		daemonstuff();
		syslog(LOG_DAEMON, "rs485serialserver data sender started and running");
		char inputbuf[255];
		int bytesin;
		while (1) {
			if ( (insock = accept(inputsocketfile, NULL, NULL)) == -1) {
			  syslog(LOG_WARNING,"accept error");
			  continue;
			}
			
			while ( (bytesin=read(insock,inputbuf,sizeof(inputbuf))) > 0) {
			//	printf("read %u bytes: %.*s\n", bytes, bytes, inputbuf);
				
				writeMode(serial);
			//	fprintf(stderr,"writing %d bytes:: --> %s",writesize,inputbuf);
			//	fflush(stderr);
				write(serial,inputbuf,bytesin);
				tcdrain(serial); // blocks until serial output buffer has been emptied
				readMode(serial);
			}
			if (bytesin == -1) {
			  syslog(LOG_WARNING,"socket read error");
			}
			else if (bytesin == 0) {
			  //fprintf(stderr,"Input client disconnected\n");
			  close(insock);
			}
		 }
		close(serial);
		exit(0);

	} else if ( perlpid == 0 && pid > 0 && pid2 > 0 ) {
		// child
		daemonstuff();
		close(serial);
		execl("/usr/local/bin/rs485requesthandler", NULL);
		_exit(EXIT_FAILURE);

	} else if( perlpid > 0 && pid > 0 && pid2 > 0 ) {
		// master parent proccess
		printf("started pids: %d %d %d \n", perlpid, pid, pid2);
		close(serial);
		exit(0);

	}
}


