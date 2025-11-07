# Check All Identical

Checks all elements in x identical using

`length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))`

**Pass**: `c(1, 1, 1)`, `list(1, 1)`

**Fail**: `c(1, 1.0000001)`, `list(1, NA)`

## Usage

``` r
chk_all_identical(x, x_name = NULL)

vld_all_identical(x)
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

- `vld_all_identical()`: Validate All Identical

## See also

[`length()`](https://rdrr.io/r/base/length.html)

[`vld_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_identical.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other equal_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md),
[`chk_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equal.md),
[`chk_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md),
[`chk_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_identical.md)

Other all_checkers:
[`chk_all()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all.md),
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md)

## Examples

``` r
# chk_all_identical
chk_all_identical(c(1, 1))
try(chk_all_identical(c(1, 1.1)))
#> Error in eval(expr, envir) : `c(1, 1.1)` must have identical elements.
# vld_all_identical
vld_all_identical(c(1, 1))
#> [1] TRUE
```
