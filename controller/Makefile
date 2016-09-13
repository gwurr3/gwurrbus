CC=cc
CFLAGS=-O0 -static


all: rs485serialserver rs485requesthandler rs485client

rs485serialserver:
	@echo ${CC} ${CFLAGS} rs485serialserver.c -o rs485serialserver
	@${CC} ${CFLAGS} rs485serialserver.c -o rs485serialserver

rs485requesthandler:
	@perl -c rs485requesthandler.pl

rs485client:
	@perl -c rs485client.pl
clean:
	@echo rm -f rs485serialserver
	@rm -f rs485serialserver

install: all
	@install -b -m 755 -o root -g wheel -s rs485serialserver /usr/local/bin/rs485serialserver
	@install -b -m 755 -o root -g wheel rs485requesthandler.pl /usr/local/bin/rs485requesthandler
	@install -b -m 755 -o root -g wheel rs485client.pl /usr/local/bin/rs485client
