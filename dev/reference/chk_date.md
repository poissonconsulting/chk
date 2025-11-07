# Check Date

Checks non-missing Date scalar using

`inherits(x, "Date") && length(x) == 1L && !anyNA(x)`

## Usage

``` r
chk_date(x, x_name = NULL)

vld_date(x)
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

- `vld_date()`: Validate Date

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

Other datetime_checkers:
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md)

## Examples

``` r
# chk_date
chk_date(Sys.Date())
try(chk_date(1))
#> Error in eval(expr, envir) : 
#>   `1` must be a date (non-missing Date scalar).
# vld_date
vld_date(Sys.Date())
#> [1] TRUE
vld_date(Sys.time())
#> [1] FALSE
vld_date(1)
#> [1] FALSE
```
