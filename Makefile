# 
# libexact v1.0 --- a software library for solving combinatorial 
#                   exact covering problems
# 
# Copyright (C) 2008 Petteri Kaski <petteri.kaski@cs.helsinki.fi>
#                    Olli Pottonen <olli.pottonen@tkk.fi>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, 
# MA  02110-1301, USA.

# Modified by Denis S. Krotov (archive file date 2023-07-26) to use GCC in C99 mode.
# Updated 2026-11-22 for recursive builds and the check target.

CC = gcc
CFLAGS = -std=c99 -O3
AR = ar

.PHONY: all examples check clean

all: libexact.a solve test examples

libexact.a: exact.o util.o
	$(AR) -r libexact.a exact.o util.o

solve: solve.o libexact.a
	$(CC) -o solve solve.o libexact.a

test: test.o libexact.a
	$(CC) -o test test.o libexact.a

examples: libexact.a
	$(MAKE) -C examples

check:	test
	./test

clean:
	rm -f *.o *.a *~ solve test
	$(MAKE) -C examples clean
