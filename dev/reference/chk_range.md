# Checks range of non-missing values

Checks all non-missing values fall within range using

If inclusive

`all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])`

else

`all(x[!is.na(x)] > range[1] & x[!is.na(x)] < range[2])`

## Usage

``` r
chk_range(x, range = c(0, 1), inclusive = TRUE, x_name = NULL)

vld_range(x, range = c(0, 1), inclusive = TRUE)
```

## Arguments

- x:

  The object to check.

- range:

  A non-missing sorted vector of length 2 of the lower and upper
  permitted values.

- inclusive:

  A flag specifying whether the range is exclusive.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_range()`: Validate Range

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other range_checkers:
[`chk_gt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gt.md),
[`chk_gte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gte.md),
[`chk_lt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lt.md),
[`chk_lte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lte.md)

## Examples

``` r
# chk_range
chk_range(0)
try(chk_range(-0.1))
#> Error in eval(expr, envir) : `-0.1` must be between 0 and 1, not -0.1.
# vld_range
vld_range(numeric(0))
#> [1] TRUE
vld_range(0)
#> [1] TRUE
vld_range(-0.1)
#> [1] FALSE
vld_range(c(0.1, 0.2, NA))
#> [1] TRUE
vld_range(c(0.1, 0.2, NA), range = c(0, 1))
#> [1] TRUE
```
