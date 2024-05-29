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
PROJECT	= helloc
VERSION = 0.1

ASM	= nasm
ASMFLAGS= -Ox -felf64 -w+all -w-reloc-rel-dword
CC	= gcc
CFLAGS	= -O2 -march=native -Wall -Wextra
LDLIBS	=
LDFLAGS	=


################
# Build system #
################
MKDIR	= mkdir -p
RM	= rm -fv
ASMFLAGS += -DPROJECT=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\"
CFLAGS	+= -DPROJECT=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\"

.PHONY: all build build-test clean debug distclean test
.DEFAULT_GOAL:= all
all: build build-test

debug: all
debug: ASMFLAGS	+= -g -DDEBUG
debug: CFLAGS	+= -g -Og -DDEBUG

# Compile assembly sources
%.s.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<


# Programs 
PROGRAMS = helloc
build: $(PROGRAMS)

helloc: helloc.o helloc.s.o


# Tests
TESTS	= test_helloc
build-test: $(TESTS)
test: build-test
	@for t in $(TESTS); do		\
		echo \--- $$t ;		\
		./$$t ;			\
	done

test_helloc: test_helloc.o helloc.s.o


# Cleanup 
clean:
	$(RM) *.o *.d

distclean: clean
	$(RM) $(PROGRAMS)
	$(RM) $(TESTS)
