# Check All

Checks all elements using

`all(vapply(x, chk_fun, TRUE, ...))`

## Usage

``` r
chk_all(x, chk_fun, ..., x_name = NULL)

vld_all(x, vld_fun, ...)
```

## Arguments

- x:

  The object to check.

- chk_fun:

  A chk\_ function.

- ...:

  Additional arguments.

- x_name:

  A string of the name of object x or NULL.

- vld_fun:

  A vld\_ function.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_all()`: Validate All

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other all_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md)

## Examples

``` r
# chk_all
chk_all(TRUE, chk_lgl)
# FIXME try(chk_all(1, chk_lgl))
chk_all(c(TRUE, NA), chk_lgl)
# vld_all
vld_all(c(TRUE, NA), vld_lgl)
#> [1] TRUE
```
