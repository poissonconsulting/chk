# Check Date Time

Checks if non-missing POSIXct scalar using

`inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)`

## Usage

``` r
chk_date_time(x, x_name = NULL)

chk_datetime(x, x_name = NULL)

vld_date_time(x)

vld_datetime(x)
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

- `chk_datetime()`: Check Date Time (Deprecated)

  **\[deprecated\]**

- `vld_date_time()`: Validate Date Time

- `vld_datetime()`: Validate Date Time (Deprecated)

  **\[deprecated\]**

## See also

[`inherits()`](https://rdrr.io/r/base/class.html),
[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

Other datetime_checkers:
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md)

## Examples

``` r
# chk_date_time
chk_date_time(as.POSIXct("2001-01-02"))
try(chk_date_time(1))
#> Error in eval(expr, envir) : 
#>   `1` must be a date time (non-missing POSIXct scalar).
# vld_date_time
vld_date_time(as.POSIXct("2001-01-02"))
#> [1] TRUE
vld_date_time(Sys.time())
#> [1] TRUE
vld_date_time(1)
#> [1] FALSE
vld_date_time("2001-01-02")
#> [1] FALSE
vld_date_time(c(Sys.time(), Sys.time()))
#> [1] FALSE
```
