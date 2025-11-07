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
