# Check Factor

Checks if factor using

`is.factor(x)`

## Usage

``` r
chk_factor(x, x_name = NULL)

vld_factor(x)
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

- `vld_factor()`: Validate Factor

## See also

[`is.factor()`](https://rdrr.io/r/base/factor.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other factor_checkers:
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md)

## Examples

``` r
# chk_factor
chk_factor(factor("1"))
try(chk_factor("1"))
#> Error in eval(expr, envir) : `"1"` must be factor.
# vld_factor
vld_factor(factor("1"))
#> [1] TRUE
vld_factor(factor(0))
#> [1] TRUE
vld_factor("1")
#> [1] FALSE
vld_factor(1L)
#> [1] FALSE
```
