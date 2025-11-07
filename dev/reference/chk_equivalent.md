# Check Equivalent

Checks if is equivalent (equal ignoring attributes) to y using

`vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))`

## Usage

``` r
chk_equivalent(x, y, tolerance = sqrt(.Machine$double.eps), x_name = NULL)

vld_equivalent(x, y, tolerance = sqrt(.Machine$double.eps))
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

- `vld_equivalent()`: Validate Equivalent

## See also

[`vld_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

[`all.equal()`](https://rdrr.io/r/base/all.equal.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other equal_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md),
[`chk_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equal.md),
[`chk_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_identical.md)

## Examples

``` r
# chk_equivalent
chk_equivalent(1, 1.00000001)
try(chk_equivalent(1, 1.0000001))
#> Error in eval(expr, envir) : `1` must be equivalent to 1.0000001.
#> Use `rlang::last_error()$y` to show the object compared to.
chk_equivalent(1, 1L)
chk_equivalent(c(x = 1), c(y = 1))
vld_equivalent(c(x = 1), c(y = 1L))
#> [1] TRUE
```
