# Check Double Scalar

Checks if double scalar using

`is.double(x) && length(x) == 1L`

**\[deprecated\]**

## Usage

``` r
chk_dbl(x, x_name = NULL)

vld_dbl(x)
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

- `vld_dbl()`: Validate Double

  **\[deprecated\]**

## See also

Other deprecated:
[`chk_chr()`](https://poissonconsulting.github.io/chk/dev/reference/chk_chr.md),
[`chk_deprecated`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
[`chk_wnum()`](https://poissonconsulting.github.io/chk/dev/reference/chk_wnum.md)

## Examples

``` r
# chk_dbl
chk_dbl(1)
try(chk_dbl(1L))
#> Warning: `chk_dbl()` was deprecated in chk 0.6.1.
#> ℹ Please use `chk::chk_scalar(x);` `chk::chk_double(x)` instead
#> Error in eval(expr, envir) : `1L` must be double (real) scalar.
# vld_dbl
vld_dbl(1)
#> [1] TRUE
vld_dbl(double(0))
#> [1] FALSE
vld_dbl(NA_real_)
#> [1] TRUE
vld_dbl(c(1, 1))
#> [1] FALSE
vld_dbl(1L)
#> [1] FALSE
```
