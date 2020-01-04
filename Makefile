CC=gcc
CFLAGS=-g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)


jcc: $(OBJS)
	$(CC) -o jcc $(OBJS) $(CFLAGS)

$(OBJS): jcc.h

test: jcc test/func.o
	gcc -c test/func.c
	./jcc test/test.c > test/test.s
	gcc -o test/test test/test.s test/func.o
	test/test

clean:
	rm -f jcc *.o *~ tmp*

.PHONY: test clean
