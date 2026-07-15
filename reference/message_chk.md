# Construct Tidyverse Style Message

If `tidy = TRUE` constructs a tidyverse style message by

## Usage

``` r
message_chk(..., n = NULL, tidy = TRUE)
```

## Arguments

- ...:

  Multiple objects that are converted to a string using
  `paste0(..., collapse = '')`.

- n:

  The value of n for converting `sprintf`-like types.

- tidy:

  A flag specifying whether capitalize the first character and add a
  missing period.

## Value

A string of the message.

## Details

- Capitalizing the first character if possible.

- Adding a trailing . if missing.

Also if `n != NULL` replaces the recognized `sprintf`-like types.

## `sprintf`-like types

The following recognized `sprintf`-like types can be used in a message:

- `n`:

  The value of n.

- `s`:

  ” if n == 1 otherwise 's'

- `r`:

  'is' if n == 1 otherwise 'are'

- `y`:

  'y' if n == 1 otherwise 'ie'

## Examples

``` r
message_chk("there %r %n", " problem director%y%s")
#> [1] "There %r %n problem director%y%s."
message_chk("there %r %n", " problem director%y%s", n = 1)
#> [1] "There is 1 problem directory."
message_chk("There %r %n", " problem director%y%s.", n = 3)
#> [1] "There are 3 problem directories."
```
