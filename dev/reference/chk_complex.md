# Check Complex

Checks if complex using

`is.complex(x)`

## Usage

``` r
chk_complex(x, x_name = NULL)

vld_complex(x)
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

- `vld_complex()`: Validate Complex

## See also

[`is.complex()`](https://rdrr.io/r/base/complex.html)

For more details about the use of this function, please read the article
[chk
families](https://poissonconsulting.github.io/chk/articles/chk-families.html).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

## Examples

``` r
# chk_complex
chk_complex(1i)
try(chk_complex(1))
#> Error in eval(expr, envir) : `1` must be complex.
# vld_complex
vld_complex(1i)
#> [1] TRUE
vld_complex(complex())
#> [1] TRUE
vld_complex(NA_complex_)
#> [1] TRUE
vld_complex(1)
#> [1] FALSE
vld_complex(TRUE)
#> [1] FALSE
```
