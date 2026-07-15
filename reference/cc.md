# Concatenate with Commas

Concatenates object values into a string with each value separated by a
comma and the last value separated by a conjunction.

## Usage

``` r
cc(
  x,
  conj = ", ",
  sep = ", ",
  brac = if (is.character(x) || is.factor(x)) "'" else "",
  ellipsis = 10L,
  chk = TRUE
)
```

## Arguments

- x:

  The object to concatenate.

- conj:

  A string of the conjunction to separate the last value by.

- sep:

  A string of the separator.

- brac:

  A string to brac the values by.

- ellipsis:

  A numeric scalar of the maximum number of values to display before
  using an ellipsis.

- chk:

  A flag specifying whether to check the other parameters.

## Value

A string.

## Details

By default, if x has more than 10 values an ellipsis is used to ensure
only 10 values are displayed (including the ellipsis).

## Examples

``` r
cc(1:2)
#> [1] "1, 2"
cc(1:2, conj = " or")
#> [1] "1 or2"
cc(3:1, brac = "'")
#> [1] "'3', '2', '1'"
cc(1:11)
#> [1] "1, 2, 3, 4, 5, 6, 7, 8, ..., 11"
cc(as.character(1:2))
#> [1] "'1', '2'"
```
