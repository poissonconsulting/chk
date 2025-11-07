# Check Greater Than

Checks if all non-missing values are greater than value using

`all(x[!is.na(x)] > value)`

## Usage

``` r
chk_gt(x, value = 0, x_name = NULL)

vld_gt(x, value = 0)
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

- `vld_gt()`: Validate Greater Than

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other range_checkers:
[`chk_gte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gte.md),
[`chk_lt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lt.md),
[`chk_lte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lte.md),
[`chk_range()`](https://poissonconsulting.github.io/chk/dev/reference/chk_range.md)

## Examples

``` r
# chk_gt
chk_gt(0.1)
try(chk_gt(c(0.1, -0.2)))
#> Error in eval(expr, envir) : 
#>   `c(0.1, -0.2)` must have values greater than 0.
# vld_gt
vld_gt(numeric(0))
#> [1] TRUE
vld_gt(0)
#> [1] FALSE
vld_gt(0.1)
#> [1] TRUE
vld_gt(c(0.1, 0.2, NA))
#> [1] TRUE
vld_gt(c(0.1, -0.2))
#> [1] FALSE
vld_gt(c(-0.1, 0.2), value = -1)
#> [1] TRUE
vld_gt("b", value = "a")
#> [1] TRUE
```
