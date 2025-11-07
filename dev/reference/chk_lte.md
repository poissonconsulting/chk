# Check Less Than or Equal To

Checks if all non-missing values are less than or equal to y using

`all(x[!is.na(x)] <= value)`

## Usage

``` r
chk_lte(x, value = 0, x_name = NULL)

vld_lte(x, value = 0)
```

## Arguments

- x:

  The object to check.

- value:

  A non-missing scalar of a value.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_lte()`: Validate Less Than or Equal To

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other range_checkers:
[`chk_gt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gt.md),
[`chk_gte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gte.md),
[`chk_lt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lt.md),
[`chk_range()`](https://poissonconsulting.github.io/chk/dev/reference/chk_range.md)

## Examples

``` r
# chk_lte
chk_lte(0)
try(chk_lte(0.1))
#> Error in eval(expr, envir) : 
#>   `0.1` must be less than or equal to 0, not 0.1.
# vld_lte
vld_lte(numeric(0))
#> [1] TRUE
vld_lte(0)
#> [1] TRUE
vld_lte(0.1)
#> [1] FALSE
vld_lte(c(-0.1, -0.2, NA))
#> [1] TRUE
vld_lte(c(-0.1, -0.2, NA), value = -1)
#> [1] FALSE
```
