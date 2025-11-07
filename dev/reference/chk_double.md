# Check Double

Checks if double using

`is.double(x)`

## Usage

``` r
chk_double(x, x_name = NULL)

vld_double(x)
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

- `vld_double()`: Validate Double

## See also

[`is.double()`](https://rdrr.io/r/base/double.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

## Examples

``` r
# chk_double
chk_double(1)
try(chk_double(1L))
#> Error in eval(expr, envir) : `1L` must be double.
# vld_double
vld_double(1)
#> [1] TRUE
vld_double(matrix(c(1, 2, 3, 4), nrow = 2L))
#> [1] TRUE
vld_double(double(0))
#> [1] TRUE
vld_double(numeric(0))
#> [1] TRUE
vld_double(NA_real_)
#> [1] TRUE
vld_double(1L)
#> [1] FALSE
vld_double(TRUE)
#> [1] FALSE
```
