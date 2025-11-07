# Check Raw

Checks if raw using

`is.raw(x)`

## Usage

``` r
chk_raw(x, x_name = NULL)

vld_raw(x)
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

- `vld_raw()`: Validate Raw

## See also

[`is.raw()`](https://rdrr.io/r/base/raw.html)

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
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md)

## Examples

``` r
# chk_raw
chk_raw(as.raw(1))
try(chk_raw(1))
#> Error in eval(expr, envir) : `1` must be raw.
# vld_raw
vld_raw(as.raw(1))
#> [1] TRUE
vld_raw(raw(0))
#> [1] TRUE
vld_raw(1)
#> [1] FALSE
vld_raw(TRUE)
#> [1] FALSE
```
