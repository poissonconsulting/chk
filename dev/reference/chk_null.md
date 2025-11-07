# Check NULL

Checks if NULL using

`is.null(x)`

## Usage

``` r
chk_null(x, x_name = NULL)

vld_null(x)
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

- `vld_null()`: Validate NULL

## See also

[`is.null()`](https://rdrr.io/r/base/NULL.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other null_checkers:
[`chk_not_null()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_null.md)

## Examples

``` r
# chk_null
try(chk_null(1))
#> Error in eval(expr, envir) : `1` must be NULL.
chk_null(NULL)
# vld_null
vld_null(NULL)
#> [1] TRUE
vld_null(1)
#> [1] FALSE
```
