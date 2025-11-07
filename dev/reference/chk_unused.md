# Check ... Unused

Checks if ... is unused

`length(list(...)) == 0L`

## Usage

``` r
chk_unused(...)

vld_unused(...)
```

## Arguments

- ...:

  Additional arguments.

## Value

The `chk_` function throws an informative error if the test fails.

## Functions

- `vld_unused()`: Validate ... Unused

## See also

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other ellipsis_checkers:
[`chk_used()`](https://poissonconsulting.github.io/chk/dev/reference/chk_used.md)

## Examples

``` r
# chk_unused
fun <- function(x, ...) {
  chk_unused(...)
  x
}
fun(1)
#> [1] 1
try(fun(1, 2))
#> Error in fun(1, 2) : `...` must be unused.
# vld_unused
fun <- function(x, ...) {
  vld_unused(...)
}
fun(1)
#> [1] TRUE
try(fun(1, 2))
#> [1] FALSE
```
