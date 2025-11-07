# Check ... Used

Checks if is ... used using

`length(list(...)) != 0L`

## Usage

``` r
chk_used(...)

vld_used(...)
```

## Arguments

- ...:

  Additional arguments.

## Value

The `chk_` function throws an informative error if the test fails.

## Functions

- `vld_used()`: Validate ... Used

## See also

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other ellipsis_checkers:
[`chk_unused()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unused.md)

## Examples

``` r
# chk_used
fun <- function(x, ...) {
  chk_used(...)
  x
}
try(fun(1))
#> Error in fun(1) : `...` must be used.
fun(1, 2)
#> [1] 1
# vld_used
fun <- function(x, ...) {
  vld_used(...)
}
fun(1)
#> [1] FALSE
fun(1, 2)
#> [1] TRUE
```
