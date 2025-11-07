# Check Count

Checks if non-negative whole number using

`vld_whole_number(x) && x >= 0`

## Usage

``` r
chk_count(x, x_name = NULL)

vld_count(x)
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

- `vld_count()`: Validate Count

## See also

[`vld_whole_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_number.md)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other scalar_checkers:
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

Other whole_number_checkers:
[`chk_whole_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_number.md),
[`chk_whole_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_numeric.md)

## Examples

``` r
# chk_count
chk_count(1)
try(chk_count(1.5))
#> Error in eval(expr, envir) : 
#>   `1.5` must be a count (non-negative non-missing integer scalar or double equivalent).
# vld_count
vld_count(1)
#> [1] TRUE
vld_count(0L)
#> [1] TRUE
vld_count(-1)
#> [1] FALSE
vld_count(0.5)
#> [1] FALSE
```
