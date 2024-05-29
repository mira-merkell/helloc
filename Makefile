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

PROGRAM	= helloc

SRCS	= helloc.c helloc.s
OBJS	= $(SRCS:%=%.o)
DEPS	= $(SRCS:%=%.d)

AS	= nasm
ASFLAGS	= -g -Ox -felf64 -w+all -w-reloc-rel-dword
CC	= gcc
CFLAGS	= -g -Og -march=native -Wall -Wextra
LDLIBS	=
LDFLAGS	=

MKDIR	= mkdir -p
RM	= rm -fv


.DEFAULT_GOAL	:= all

.PHONY: all
all: $(PROGRAM)

-include $(DEPS)
$(PROGRAM): $(OBJS)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS)

%.c.o: %.c
	$(CC) -MP -MMD $(CFLAGS) -o $@ -c $<

%.s.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<


.PHONY: clean
clean:
	$(RM) $(OBJS) $(DEPS)
	$(RM) $(PROGRAM)
