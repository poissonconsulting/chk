# Check Equal

Checks if is equal (identical within tolerance) to y using

`vld_true(all.equal(x, y, tolerance))`

## Usage

``` r
chk_equal(x, y, tolerance = sqrt(.Machine$double.eps), x_name = NULL)

vld_equal(x, y, tolerance = sqrt(.Machine$double.eps))
```

## Arguments

- x:

  The object to check.

- y:

  An object to check against.

- tolerance:

  A non-negative numeric scalar.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_equal()`: Validate Equal

## See also

[`vld_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

[`all.equal()`](https://rdrr.io/r/base/all.equal.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other equal_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md),
[`chk_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md),
[`chk_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_identical.md)

## Examples

``` r
# chk_equal
chk_equal(1, 1.00000001)
try(chk_equal(1, 1.0000001))
#> Error in eval(expr, envir) : `1` must be equal to 1.0000001.
#> Use `rlang::last_error()$y` to show the object compared to.
chk_equal(1, 1L)
chk_equal(c(x = 1), c(x = 1L))
try(chk_equal(c(x = 1), c(y = 1L)))
#> Error in eval(expr, envir) : `c(x = 1)` must be equal to c(y = 1L).
#> Use `rlang::last_error()$y` to show the object compared to.
vld_equal(1, 1.00000001)
#> [1] TRUE
```
