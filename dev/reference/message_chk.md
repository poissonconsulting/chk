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

- `es`:

  ” if n == 1 otherwise 'es'

- `r`:

  'is' if n == 1 otherwise 'are'

- `y`:

  'y' if n == 1 otherwise 'ie'

- `%`:

  A literal '%'.

The types are replaced in a single left to right pass, so `%%` escapes a
literal '%' and a replacement is never rescanned. A '%' that does not
start a recognized type is left as is.

## Examples

``` r
message_chk("there %r %n", " problem director%y%s")
#> [1] "There %r %n problem director%y%s."
message_chk("there %r %n", " problem director%y%s", n = 1)
#> [1] "There is 1 problem directory."
message_chk("There %r %n", " problem director%y%s.", n = 3)
#> [1] "There are 3 problem directories."
message_chk("there %r %n problem class%es", n = 1)
#> [1] "There is 1 problem class."
message_chk("there %r %n problem class%es", n = 3)
#> [1] "There are 3 problem classes."
message_chk("%n%% of value%s", n = 2)
#> [1] "2% of values."
```
