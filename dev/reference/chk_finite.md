# Check Finite

Checks if numeric with all values finite using

`is.numeric(x) && all(is.finite(x))`

Unlike the other range checkers, missing values fail.

**Pass**: `1`, `c(-1, 0, 1e10)`, `2L`, `numeric(0)`.

**Fail**: `NA`, `NaN`, `Inf`, `-Inf`, `c(1, NA)`, `TRUE`, `"1"`,
`list(1)`.

## Usage

``` r
chk_finite(x, x_name = NULL)

vld_finite(x)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_finite()`: Validate Finite

## See also

[`is.finite()`](https://rdrr.io/r/base/is.finite.html)

[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md)

[`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other range_checkers:
[`chk_gt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gt.md),
[`chk_gte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_gte.md),
[`chk_lt()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lt.md),
[`chk_lte()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lte.md),
[`chk_range()`](https://poissonconsulting.github.io/chk/dev/reference/chk_range.md)

## Examples

``` r
# chk_finite
chk_finite(1)
try(chk_finite(Inf))
#> Error in eval(expr, envir) : `Inf` must be finite, not Inf.
# vld_finite
vld_finite(numeric(0))
#> [1] TRUE
vld_finite(c(-1, 0, 1))
#> [1] TRUE
vld_finite(c(1, NA))
#> [1] FALSE
vld_finite(NaN)
#> [1] FALSE
vld_finite(-Inf)
#> [1] FALSE
```
