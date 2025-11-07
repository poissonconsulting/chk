# Check Character Scalar

Checks if character scalar using

`is.character(x) && length(x) == 1L`

**\[deprecated\]**

## Usage

``` r
chk_chr(x, x_name = NULL)

vld_chr(x)
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

- `vld_chr()`: Validate Character Scalar

  **\[deprecated\]**

## See also

Other deprecated:
[`chk_dbl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dbl.md),
[`chk_deprecated`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
[`chk_wnum()`](https://poissonconsulting.github.io/chk/dev/reference/chk_wnum.md)

## Examples

``` r
chk_chr("a")
try(chk_chr(1))
#> Warning: `chk_chr()` was deprecated in chk 0.6.1.
#> ℹ Please use `chk::chk_scalar(x);` `chk::chk_character(x)` instead
#> Error in eval(expr, envir) : `1` must be a character scalar.
# vld_chr
vld_chr("")
#> [1] TRUE
vld_chr("a")
#> [1] TRUE
vld_chr(NA_character_)
#> [1] TRUE
vld_chr(c("a", "b"))
#> [1] FALSE
vld_chr(1)
#> [1] FALSE
```
