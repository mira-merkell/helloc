/* test_helloc.c: test example.
 *
 * Copyright 2024 Marek Miller
 *
 * This file is part of helloc.
 *
 * helloc is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * helloc is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <https://www.gnu.org/licenses/>.
 */
#include <stdint.h>
#include <stdio.h>

#include "helloc.h"

static int test_rt = 0;

#define TEST_FAIL(...)	({                                                    \
	fprintf(stderr, "FAIL %s:%d \"", __FILE__, __LINE__);                 \
	fprintf(stderr, __VA_ARGS__);	                                      \
	fprintf(stderr, "\"\n");	                                      \
	test_rt = -1;                                                         \
	})

static void test_iseven(void)
{
	if (helloc_iseven(3))
		TEST_FAIL("not an even number");
}

int main(int argc, char **argv)
{
	(void)argc;
	(void)argv;

	helloc_world();
	test_iseven();

	if (test_rt == 0)
		fprintf(stderr, "OK\n");

	return test_rt;
}
