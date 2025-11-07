# Check Flag

Checks if non-missing logical scalar using

`is.logical(x) && length(x) == 1L && !anyNA(x)`

**Pass**: `TRUE`, `FALSE`.

**Fail**: `logical(0)`, `c(TRUE, TRUE)`, `"TRUE"`, `1`, `NA`.

Do not confuse this function with
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
which also checks for logical scalars of `length(x) == 1` but can
include `NA`s.

## Usage

``` r
chk_flag(x, x_name = NULL)

vld_flag(x)
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

- `vld_flag()`: Validate Flag

## See also

[`is.logical()`](https://rdrr.io/r/base/logical.html)
[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other logical_checkers:
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

Other scalar_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_date()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date.md),
[`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md),
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md),
[`chk_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md),
[`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)

## Examples

``` r
# chk_flag
chk_flag(TRUE)
try(vld_flag(1))
#> [1] FALSE
# vld_flag
vld_flag(TRUE)
#> [1] TRUE
vld_flag(1)
#> [1] FALSE
```
