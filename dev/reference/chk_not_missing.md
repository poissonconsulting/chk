# Check Not Missing Argument

Checks argument not missing using

`!missing(x)`

## Usage

``` r
chk_not_missing(x, x_name = "`x`")

vld_not_missing(x)
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

## Details

Currently only checks if value is available (as opposed to whether it
was specified).

## Functions

- `vld_not_missing()`: Validate Not Missing Argument

## See also

[`missing()`](https://rdrr.io/r/base/missing.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other missing_checkers:
[`chk_function()`](https://poissonconsulting.github.io/chk/dev/reference/chk_function.md),
[`chk_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_missing.md)

## Examples

``` r
# chk_not_missing
fun <- function(x) {
  chk_not_missing(x)
}
fun(1)
try(fun())
#> Error in fun() : `x` must not be missing.
# vld_not_missing
fun <- function(x) {
  vld_not_missing(x)
}
fun()
#> [1] FALSE
fun(1)
#> [1] TRUE
```
