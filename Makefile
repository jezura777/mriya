PROG = mriya
SRCS = mriya.c 
OBJS = ${SRCS:.c=.o}

PREFIX ?= /usr/local

all: ${PROG}

mriya.o: config.h

.c.o:
	${CC} ${CFLAGS} ${CPPFLAGS} -c $<

${PROG}: ${OBJS}
	${CC} -o $@ ${OBJS} -lX11 ${LDFLAGS}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install -m 755 ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}

uninstall:
	rm ${DESTDIR}${PREFIX}/bin/${PROG}

clean:
	-rm -f ${OBJS} ${PROG}

.PHONY: all clean install uninstall
