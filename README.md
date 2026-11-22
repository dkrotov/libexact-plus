# libexact+

libexact+ extends [libexact 1.0](https://pottonen.kapsi.fi/libexact.html)
by Petteri Kaski and Olli Pottonen with secondary constraints. A hard row
must be covered exactly the specified number of times. A soft row sets
an upper bound on how many times it may be covered.

## Build and test

Run `make` with GCC and Make on a Unix-like system. This builds the static
library `libexact.a`, the command-line solver `solve`, the test program,
and the examples. Run `make check` to run the original test suite.

The solver accepts `r` or `h` for hard rows and `s` for soft rows.
For example, `s 20 2` declares row 20 with an upper bound of 2.
To count the solutions of a small example, run:

```sh
./solve --count examples/solve-soft-unit
```

The expected count is 5. In C, use `exact_declare_soft_row(e, 20, 2)`
from [exact.h](exact.h).

See [README+.txt](README+.txt) for details of the extension and
[the original User's Guide](guide.pdf) for the libexact API and input format.

## Citation

If you use libexact+ in research, please cite the original libexact
report where possible:

> Petteri Kaski and Olli Pottonen. *libexact User's Guide*, Version 1.0.
> HIIT Technical Reports 2008–1, Helsinki Institute for Information
> Technology HIIT, 2008.

The [report](https://pottonen.kapsi.fi/hiit-tr-2008-1.pdf) and its
[BibTeX entry](CITATION.bib) are available online. If your results depend
on secondary constraints, please also state the libexact+ release or
commit used so that others can reproduce them.

## License

libexact+ is distributed under the GNU General Public License, version 2
or any later version (GPL-2.0-or-later). See [LICENSE](LICENSE).
The original libexact is copyright © 2008 Petteri Kaski and Olli Pottonen.
