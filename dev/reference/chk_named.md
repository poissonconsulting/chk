# Check Named

Checks if is named using

`!is.null(names(x))`

## Usage

``` r
chk_named(x, x_name = NULL)

vld_named(x)
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

- `vld_named()`: Validate Named

## See also

[`names()`](https://rdrr.io/r/base/names.html)

[`is.null()`](https://rdrr.io/r/base/NULL.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other name_checkers:
[`chk_valid_name()`](https://poissonconsulting.github.io/chk/dev/reference/chk_valid_name.md)

## Examples

``` r
# chk_named
chk_named(c(x = 1))
try(chk_named(list(1)))
#> Error in eval(expr, envir) : `list(1)` must be named.
# vld_named
vld_named(c(x = 1))
#> [1] TRUE
vld_named(list(x = 1))
#> [1] TRUE
vld_named(c(x = 1)[-1])
#> [1] TRUE
vld_named(list(x = 1)[-1])
#> [1] TRUE
vld_named(1)
#> [1] FALSE
vld_named(list(1))
#> [1] FALSE
```
