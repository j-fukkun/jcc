CC=gcc
CFLAGS=-g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)


9cc: $(OBJS)
	$(CC) -o 9cc $(OBJS) $(CFLAGS)

$(OBJS): 9cc.h

test: 9cc test/func.o
	gcc -c test/func.c
	./9cc test/test.c > test/test.s
	gcc -o test/test test/test.s test/func.o
	test/test

clean:
	rm -f 9cc *.o *~ tmp*

.PHONY: test clean
