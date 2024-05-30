/* helloc.h: main helloc functionality.
 *
 * Copyright 2024 ⧉⧉⧉
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
#ifndef HELLOC_H
#define HELLOC_H

#include <stdint.h>

/* Print a hello message to stdout.
 *
 * Arguments:
 *	void
 *
 * Returns:
 *	void
 */
void helloc_world(void);

/* Test, if the number is even.
 *
 * Arguments:
 * 	a	unsigned integer to check
 *
 * Returns:
 *	1	if a is even
 *	0	if a is odd
 */
int helloc_iseven(uint64_t a);

#endif /* HELLOC_H */
