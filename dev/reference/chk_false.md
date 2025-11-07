# Check FALSE

Check if FALSE using

`is.logical(x) && length(x) == 1L && !anyNA(x) && !x`

## Usage

``` r
chk_false(x, x_name = NULL)

vld_false(x)
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

- `vld_false()`: Validate FALSE

## See also

[`is.logical()`](https://rdrr.io/r/base/logical.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other logical_checkers:
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

## Examples

``` r
# chk_false
chk_false(FALSE)
try(chk_false(0))
#> Error in eval(expr, envir) : `0` must be FALSE.
# vld_false
vld_false(TRUE)
#> [1] FALSE
vld_false(FALSE)
#> [1] TRUE
vld_false(NA)
#> [1] FALSE
vld_false(0)
#> [1] FALSE
vld_false(c(FALSE, FALSE))
#> [1] FALSE
```
