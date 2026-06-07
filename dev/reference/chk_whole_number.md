# Check Whole Number

Checks if non-missing integer scalar or double equivalent using

`vld_number(x) && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`

**Pass**: `1`, `2L`, `1e10`, `-Inf`

**Fail**: `"a"`, `1:3`, `NA_integer_`, `log(10)`

## Usage

``` r
chk_whole_number(x, x_name = NULL)

vld_whole_number(x)
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

- `vld_whole_number()`: Validate Whole Number

## See also

[`is.integer()`](https://rdrr.io/r/base/integer.html)

[`vld_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

[`vld_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_number.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other scalar_checkers:
[`chk_complex_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex_number.md),
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_number.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

Other whole_number_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_whole_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_numeric.md)

## Examples

``` r
# chk_whole_number
chk_whole_number(2)
try(chk_whole_number(1.1))
#> Error in eval(expr, envir) : 
#>   `1.1` must be a whole number (non-missing integer scalar or double equivalent).
# vld_whole_number
vld_whole_number(2)
#> [1] TRUE
```
