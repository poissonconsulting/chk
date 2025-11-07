# Check Logical Scalar

Checks if logical scalar using

`is.logical(x) && length(x) == 1L`

If you only want to check the data type (not whether `length(x) == 1`),
you should use the
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md)
function.

## Usage

``` r
chk_lgl(x, x_name = NULL)

vld_lgl(x)
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

- `vld_lgl()`: Validate Logical Scalar

## See also

[`is.logical()`](https://rdrr.io/r/base/logical.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other logical_checkers:
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

## Examples

``` r
# chk_lgl
chk_lgl(NA)
try(chk_lgl(1))
#> Error in eval(expr, envir) : 
#>   `1` must be a logical scalar (TRUE, FALSE or NA).
# vld_lgl
vld_lgl(TRUE)
#> Warning: `chk_lgl()` was deprecated in chk 0.9.3.
#> ℹ Please use `chk::chk_scalar(x);` `chk::chk_logical(x)` instead
#> [1] TRUE
vld_lgl(FALSE)
#> [1] TRUE
vld_lgl(NA)
#> [1] TRUE
vld_lgl(1)
#> [1] FALSE
vld_lgl(c(TRUE, TRUE))
#> [1] FALSE
```
