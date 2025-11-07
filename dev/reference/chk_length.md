# Check Length

Checks length is a particular value or range using

`length(x) >= length && length(x) <= upper`

## Usage

``` r
chk_length(x, length = 1L, upper = length, x_name = NULL)

vld_length(x, length = 1L, upper = length)
```

## Arguments

- x:

  The object to check.

- length:

  A count of the length.

- upper:

  A count of the max length.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_length()`: Validate Length

## See also

[`length()`](https://rdrr.io/r/base/length.html),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other length_checkers:
[`chk_compatible_lengths()`](https://poissonconsulting.github.io/chk/dev/reference/chk_compatible_lengths.md)

## Examples

``` r
# chk_length
chk_length("text")
try(vld_length("text", length = 2))
#> [1] FALSE
# vld_length
vld_length(2:1, 2)
#> [1] TRUE
vld_length(2:1, 1)
#> [1] FALSE
```
