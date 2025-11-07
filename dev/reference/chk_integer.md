# Check Integer

Checks if integer using

`is.integer(x)`

## Usage

``` r
chk_integer(x, x_name = NULL)

vld_integer(x)
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

- `vld_integer()`: Validate Integer

## See also

[`is.integer()`](https://rdrr.io/r/base/integer.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

## Examples

``` r
# chk_integer
chk_integer(1L)
try(chk_integer(1))
#> Error in eval(expr, envir) : `1` must be integer.
# vld_integer
vld_integer(1L)
#> [1] TRUE
vld_integer(matrix(1:4, nrow = 2L))
#> [1] TRUE
vld_integer(integer(0))
#> [1] TRUE
vld_integer(NA_integer_)
#> [1] TRUE
vld_integer(1)
#> [1] FALSE
vld_integer(TRUE)
#> [1] FALSE
```
