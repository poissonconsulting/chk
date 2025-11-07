# Check Whole Numeric Scalar

Checks if whole numeric scalar using

`is.numeric(x) && length(x) == 1L && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`

**\[deprecated\]**

## Usage

``` r
chk_wnum(x, x_name = NULL)

vld_wnum(x)
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

- `vld_wnum()`: Validate Whole Numeric Scalar

  **\[deprecated\]**

## See also

Other deprecated:
[`chk_chr()`](https://poissonconsulting.github.io/chk/dev/reference/chk_chr.md),
[`chk_dbl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dbl.md),
[`chk_deprecated`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)

## Examples

``` r
# chk_wnum
chk_wnum(1)
try(chk_wnum(1.1))
#> Warning: `chk_wnum()` was deprecated in chk 0.6.1.
#> ℹ Please use `chk::chk_scalar(x);` `chk::chk_whole_numeric(x)` instead
#> Error in eval(expr, envir) : `1.1` must be a whole numeric scalar.
# vld_wnum
vld_wnum(1)
#> [1] TRUE
vld_wnum(double(0))
#> [1] FALSE
vld_wnum(NA_real_)
#> [1] TRUE
vld_wnum(c(1, 1))
#> [1] FALSE
vld_wnum(1L)
#> [1] TRUE
```
