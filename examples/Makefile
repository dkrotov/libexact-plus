# Modified by Denis S. Krotov (archive file date 2023-07-26) to use GCC in C99 mode.

CC = gcc
CFLAGS = -std=c99 -O3 -I ..

all: example-first example-partition example-sudoku

example-first: example-first.o ../libexact.a
	$(CC) -o example-first example-first.o ../libexact.a

example-partition: example-partition.o ../libexact.a
	$(CC) -o example-partition example-partition.o ../libexact.a

example-sudoku: example-sudoku.o ../libexact.a
	$(CC) -o example-sudoku example-sudoku.o ../libexact.a

clean:
	rm -f *.o *~ example-first example-partition example-sudoku
