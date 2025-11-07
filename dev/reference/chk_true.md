# Check TRUE

Checks if TRUE using

`is.logical(x) && length(x) == 1L && !anyNA(x) && x`

## Usage

``` r
chk_true(x, x_name = NULL)

vld_true(x)
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

- `vld_true()`: Validate TRUE

## See also

[`is.logical()`](https://rdrr.io/r/base/logical.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other logical_checkers:
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md)

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

## Examples

``` r
# chk_true
chk_true(TRUE)
try(chk_true(1))
#> Error in eval(expr, envir) : `1` must be TRUE.
# vld_true
vld_true(TRUE)
#> [1] TRUE
vld_true(FALSE)
#> [1] FALSE
vld_true(NA)
#> [1] FALSE
vld_true(0)
#> [1] FALSE
vld_true(c(TRUE, TRUE))
#> [1] FALSE
```
