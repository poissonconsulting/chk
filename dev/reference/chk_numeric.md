# Check Numeric

Checks if numeric using

`is.numeric(x)`

**Pass**: `1`, `1:2`, `NA_real_`, `integer(0)`, `matrix(1:3)`.

**Fail**: `TRUE`, `"1"`, `NA`, `NULL`.

## Usage

``` r
chk_numeric(x, x_name = NULL)

vld_numeric(x)
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

- `vld_numeric()`: Validate Numeric

## See also

[`is.numeric()`](https://rdrr.io/r/base/numeric.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

## Examples

``` r
# chk_numeric
chk_numeric(1)
try(chk_numeric("1"))
#> Error in eval(expr, envir) : `"1"` must be numeric.
# vld_numeric
vld_numeric(1)
#> [1] TRUE
vld_numeric(1:2)
#> [1] TRUE
vld_numeric(NA_real_)
#> [1] TRUE
vld_numeric(integer(0))
#> [1] TRUE
vld_numeric("1")
#> [1] FALSE
vld_numeric(TRUE)
#> [1] FALSE
```
