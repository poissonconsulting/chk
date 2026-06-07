# Check Number

Checks if non-missing numeric scalar using

`is.numeric(x) && length(x) == 1L && !anyNA(x)`

**Pass**: `1`, `2L`, `log(10)`, `-Inf`

**Fail**: `"a"`, `1:3`, `NA_real_`

## Usage

``` r
chk_number(x, x_name = NULL)

vld_number(x)
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

- `vld_number()`: Validate Number

## See also

[`is.numeric()`](https://rdrr.io/r/base/numeric.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_factor.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

Other scalar_checkers:
[`chk_complex_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex_number.md),
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md),
[`chk_whole_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_number.md)

## Examples

``` r
# chk_number
chk_number(1.1)
try(chk_number(TRUE))
#> Error in eval(expr, envir) : 
#>   `TRUE` must be a number (non-missing numeric scalar).
# vld_number
vld_number(1.1)
#> [1] TRUE
```
