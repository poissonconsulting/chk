# Check Missing Argument

Checks argument missing using

`missing(x)`

## Usage

``` r
chk_missing(x, x_name = NULL)

vld_missing(x)
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

- `vld_missing()`: Validate Missing Argument

## See also

[`missing()`](https://rdrr.io/r/base/missing.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other missing_checkers:
[`chk_function()`](https://poissonconsulting.github.io/chk/dev/reference/chk_function.md),
[`chk_not_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_missing.md)

## Examples

``` r
# chk_missing
fun <- function(x) {
  chk_missing(x)
}
fun()
try(fun(1))
#> Error in fun(1) : `x` must be missing.
# vld_missing
fun <- function(x) {
  vld_missing(x)
}
fun()
#> [1] TRUE
fun(1)
#> [1] FALSE
```
