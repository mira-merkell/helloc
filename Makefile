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

###################
#  Configuration  #
###################
PROJECT	= helloc
VERSION = 0.1

AS	= nasm
ASFLAGS	= -Ox -felf64 -w+all -w-reloc-rel-dword
CC	= gcc
CFLAGS	= -O2 -march=native -Wall -Wextra
LDLIBS	=
LDFLAGS	=
MKDIR	= mkdir -p
RM	= rm -fv


##################
#  Build system  #
##################
ASFLAGS	+= -DPROJECT=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\"
CFLAGS	+= -DPROJECT=\"$(PROJECT)\" -DVERSION=\"$(VERSION)\"
export

.DEFAULT_GOAL	:= all
.PHONY: all build build-test clean debug test

all: build build-test

debug: all
debug: ASFLAGS	+= -g -DDEBUG
debug: CFLAGS	+= -g -Og -DDEBUG

build: helloc

helloc:
	make -f Makefile.helloc

build-test:
	@find . -name "Makefile.test_*" | while read f; do \
		make -f $$f ; \
	done

test: build-test
	@find . -name "Makefile.test_*" | while read f; do \
		make -sf $$f test ; \
	done

clean:
	@find . -name "Makefile.*" | while read f; do \
		make -f $$f clean ; \
	done
