# Check Character or Factor

Checks if character or factor using

`is.character(x) || is.factor(x)`

## Usage

``` r
chk_character_or_factor(x, x_name = NULL)

vld_character_or_factor(x)
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

- `vld_character_or_factor()`: Validate Character or Factor

## See also

[`is.character()`](https://rdrr.io/r/base/character.html)

[`is.factor()`](https://rdrr.io/r/base/factor.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

Other factor_checkers:
[`chk_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_factor.md)

## Examples

``` r
# chk_character_or_factor
chk_character_or_factor("1")
chk_character_or_factor(factor("1"))
try(chk_character(1))
#> Error in eval(expr, envir) : `1` must be character.
# vld_character_or_factor
vld_character_or_factor("1")
#> [1] TRUE
vld_character_or_factor(matrix("a"))
#> [1] TRUE
vld_character_or_factor(character(0))
#> [1] TRUE
vld_character_or_factor(NA_character_)
#> [1] TRUE
vld_character_or_factor(1)
#> [1] FALSE
vld_character_or_factor(TRUE)
#> [1] FALSE
vld_character_or_factor(factor("text"))
#> [1] TRUE
```
