# helloc - a template for x86\_64 assembly

This is an example of a small project written in NASM assembly for the x86\_64
platform.

## Dependencies

* [NASM](https://nasm.us) assembler
* a C compiler (gcc by default)

## How to compile the sources

Clone the repository:

```bash
git clone https://github.com/mira-merkell/helloc
cd helloc
```

Compile the source code and run the main program:

```bash
make && ./helloc
```

You can also run a test example:

```bash
make test
```

To recompile with debug symbols:

```bash
make clean
make debug
```

Refer to [Makefile](./Makefile) to see available options.


## LICENSE

helloc is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

helloc is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <https://www.gnu.org/licenses/>.
