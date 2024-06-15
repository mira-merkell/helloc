# Configuration and build system
#
# Copyright 2024 ⧉⧉⧉
#
# This file is part of helloc.
#
# helloc is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# helloc is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <https://www.gnu.org/licenses/>.

#################
# Configuration #
#################
PROGRAM	= helloc
VERSION = 1.0.1

ASM	?= nasm
ASMFLAGS+= -Ox -felf64 -w+all -w-reloc-rel-dword
CC	?= gcc
CFLAGS	+= -std=c11 -O2 -march=native -Wall -Wextra
LDLIBS	+=
LDFLAGS	+=


################
# Build system #
################
PROGS	= helloc
TESTS	= test_helloc

# Dependencies
helloc:		helloc.o helloc.s.o
helloc.o:	helloc.h
helloc.s.o:

test_helloc:	test_helloc.o helloc.s.o
test_helloc.o:	helloc.h

# Version
VERMACROS	= -DPROGRAM=\"$(PROGRAM)\" -DVERSION=\"$(VERSION)\"
ASMFLAGS	+= $(VERMACROS)
CFLAGS		+= $(VERMACROS)

# Utilities
MKDIR	= mkdir -p
RM	= rm -fv

.PHONY: all debug 		\
	build build-test	\
	test clean		\

.DEFAULT_GOAL:= all
all: build build-test

debug: build build-test
debug: ASMFLAGS	+= -DDEBUG -g
debug: CFLAGS	+= -DDEBUG -g -Og

# Generate objects with NASM assembler
%.s.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<

# Build and run tests
build:		$(PROGS)
build-test:	$(TESTS)
test: build-test
	@for t in $(TESTS); do							\
		./$$t && echo "$$t: OK" || ( echo "$$t: FAIL" ; exit 1 ) ;	\
	done

# Tidy up
clean:
	$(RM) *.o *.d
	$(RM) $(PROGS)
	$(RM) $(TESTS)
