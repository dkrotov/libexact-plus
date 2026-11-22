Secondary constraints in libexact+
=================================

This extension is based on libexact 1.0 by Petteri Kaski and Olli Pottonen.
See README.md for citation and license information. Changes for secondary
constraints in exact.c, exact.h, and solve.c are marked with
$$$_soft_ubgrade_$$$ comments.

The function exact_declare_soft_row(e, r, b) declares a soft row with
identifier r and upper bound b. A solution must cover each hard row exactly
as many times as specified, while covering each soft row at most as many
times as specified. A soft row may be left uncovered. The solver branches
on hard rows, and each selectable column must meet at least one hard row.
All rows declared through the original exact_declare_row API are hard.

In the command-line solver, use s to declare a soft row. The standard r
command and its alias h declare hard rows. The commands are case-insensitive.

Internally, hard rows appear in declaration order, followed by soft rows
in reverse declaration order. For example:

    r 10 3 # hard row 10, required multiplicity 3
    s 20 2 # soft row 20, maximum multiplicity 2
    r 11 5 # hard row 11, required multiplicity 5
    s 22 3 # soft row 22, maximum multiplicity 3

The internal row order is 10, 11, 22, 20. Declaration order can affect the
order in which libexact considers hard rows with the same branching factor.
Interleaving declarations of hard and soft rows does not change the internal
row order as long as the order within each group stays the same.
