# Check Time Zone

Checks if non-missing valid scalar timezone using

`is.character(x) && length(x) == 1L && !anyNA(x) && x %in% OlsonNames()`

## Usage

``` r
chk_tz(x, x_name = NULL)

vld_tz(x)
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

- `vld_tz()`: Validate Time Zone

## See also

[`length()`](https://rdrr.io/r/base/length.html)

[`OlsonNames()`](https://rdrr.io/r/base/timezones.html)

[`is.character()`](https://rdrr.io/r/base/character.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

## Examples

``` r
chk_tz("UTC")
try(chk_tz("TCU"))
#> Error in eval(expr, envir) : 
#>   `"TCU"` must be a tz (non-missing scalar character of a recognized timezone).
vld_tz("UTC")
#> [1] TRUE
vld_tz("TCU")
#> [1] FALSE
```
