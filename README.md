# LaTeX `listings` language definition for Emerald

## Installing

### Manual

  1. Download the [latest release of `listings-emerald.tex`](https://github.com/emerald/modes-listings/releases/download/v2019.0.0/listings-emerald.tex),
     and place it in your working LaTeX directory.

## Design and Implementation

An Emerald syntax-highlighting specification consists of the following:

  1. A list of keywords
  2. A list of built-ins
  3. A specification of what comments are like
  4. A specification of what string and character constants are like
  5. A specification to ignore casing (Emerald is case-insensitive)

The points 3-5 are covered by [`other.tex`](other.tex). As for 1-2, it
is an Emerald compiler, not this repository, which is responsible for
maintaining an up-to-date list of keywords and built-ins.

This repository makes use of the shell-scripts `bin/getkeywords.sh`
and `bin/getbuiltins.sh`, which are expected to be present in the
source directory of an Emerald compiler. These scripts are expected to
print a list of keywords and built-ins, respectively; separated, and
terminated by line breaks.

The scripts [`scripts/keywords.sh`](scripts/keywords.sh) and
[`scripts/types-from-builtins.sh`](scripts/types-from-builtins.sh)
make use of these scripts to generate LaTeX syntax specifications
for the Emerald keywords and types, respectively.

To use these scripts, pass in a path to an emerald compiler as an
argument. For example:

```
$ ./scripts/keywords.sh ../old-emerald/
    accept, and, as, assert,
    at, attached, awaiting, begin,
...
```

### m4 Template

The overall syntax file is put together using [an m4
template](listings-emerald.tex.m4). This is done for the following
reasons:

  1. It allows to combine the components above
  2. It allows to include [the license](LICENSE) verbatim
  3. It allows to include configuration identification (e.g., git commit IDs)

### Makefile

The [`Makefile`](Makefile) does nothing extra-ordinary. It assumes
that you have an Emerald compiler in `../old-emerald/` (relative to
this repository), and runs `m4` for you.

## Development

### Building

Type `make` to build `listings-emerald.tex`.

The [`Makefile`](Makefile) assumes that you have an Emerald compiler
in `../old-emerald/` (relative to this repository).

You can override this as follows:

```
$ make EMERALD_PATH="<some other path>"
```

### Bumping Versions

This repository uses the Python library
[`bumpversion`](https://github.com/peritus/bumpversion) to bump
versions in a structured manner. For instance, `bumpversion` allows to
both issue a commit, add a tag, and update the
[`README.md`](README.md) at the same time.
