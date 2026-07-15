# Check NULL Or

Checks if NULL or passes test.

## Usage

``` r
chk_null_or(x, chk, ..., vld, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- chk:

  A chk function. Soft-deprecated for vld. **\[deprecated\]**

- ...:

  Arguments passed to chk.

- vld:

  A vld function.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails.

## Examples

``` r
chk_null_or(NULL, chk_number)
#> Warning: The `chk` argument of `chk_null_or()` is deprecated as of chk 0.6.1.
#> ℹ Please use the `vld` argument instead.
chk_null_or(1, chk_number)
try(chk_null_or("1", chk_number))
#> Error in eval(expr, envir) : 
#>   `"1"` must be a number (non-missing numeric scalar) or NULL.
```
