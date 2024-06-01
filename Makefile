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

AS	= nasm
ASFLAGS	+= -Ox -felf64 -w+all -w-reloc-rel-dword
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
helloc:		main.o helloc.o
main.o:
helloc.o:	helloc.h

test_helloc:	test_helloc.o helloc.o
test_helloc.o:

# Version
VERMACROS	= -DPROGRAM=\"$(PROGRAM)\" -DVERSION=\"$(VERSION)\"
ASFLAGS		+= $(VERMACROS)
CFLAGS		+= $(VERMACROS)

MKDIR	= mkdir -p
RM	= rm -fv

.PHONY: all debug		\
	build build-test	\
	test clean		\

.DEFAULT_GOAL:= all
all: build build-test

debug: build build-test
debug: ASMFLAGS	+= -DDEBUG -g
debug: CFLAGS	+= -DDEBUG -g -Og

# Build and run tests
build:		$(PROGS)
build-test:	$(TESTS)
test: build-test
	@for t in $(TESTS); do		\
		echo \--- $$t ;		\
		./$$t ;			\
	done

# Tidy up
clean:
	$(RM) *.o *.d
	$(RM) $(PROGS)
	$(RM) $(TESTS)
