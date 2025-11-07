# Check Identical

Checks if is identical to y using

`identical(x, y)`

## Usage

``` r
chk_identical(x, y, x_name = NULL)

vld_identical(x, y)
```

## Arguments

- x:

  The object to check.

- y:

  An object to check against.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_identical()`: Validate Identical

## See also

[`identical()`](https://rdrr.io/r/base/identical.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other equal_checkers:
[`chk_all_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equal.md),
[`chk_all_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_equivalent.md),
[`chk_all_identical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all_identical.md),
[`chk_equal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equal.md),
[`chk_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md)

## Examples

``` r
# chk_identical
chk_identical(1, 1)
try(chk_identical(1, 1L))
#> Error in eval(expr, envir) : `1` must be identical to 1L.
#> Use `rlang::last_error()$y` to show the object compared to.
chk_identical(c(1, 1), c(1, 1))
try(chk_identical(1, c(1, 1)))
#> Error in eval(expr, envir) : 
#>   `1` must be identical to the y object of class <dbl>.
#> Use `rlang::last_error()$y` to show the object compared to.
vld_identical(1, 1)
#> [1] TRUE
```
