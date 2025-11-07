# Check All Equivalent

Checks all elements in x equivalent using

`length(x) < 2L || all(vapply(x, vld_equivalent, TRUE, y = x[[1]], tolerance = tolerance))`

## Usage

``` r
chk_all_equivalent(x, tolerance = sqrt(.Machine$double.eps), x_name = NULL)

vld_all_equivalent(x, tolerance = sqrt(.Machine$double.eps))
```

## Arguments

- x:

  The object to check.

- tolerance:

  A non-negative numeric scalar.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_all_equivalent()`: Validate All Equivalent

## See also

[`length()`](https://rdrr.io/r/base/length.html)

[`vld_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other equal_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md),
[`chk_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equal.md),
[`chk_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md),
[`chk_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_identical.md)

Other all_checkers:
[`chk_all()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all.md),
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md)

## Examples

``` r
# chk_all_equivalent
chk_all_equivalent(c(1, 1.00000001))
try(chk_all_equivalent(c(1, 1.0000001)))
#> Error in eval(expr, envir) : 
#>   `c(1, 1.0000001)` must have equivalent elements.
chk_all_equivalent(list(c(x = 1), c(x = 1)))
chk_all_equivalent(list(c(x = 1), c(y = 1)))
# vld_all_equivalent
vld_all_equivalent(c(x = 1, y = 1))
#> [1] TRUE
```
