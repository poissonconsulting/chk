# Check OR

The `chkor()` function has been deprecated for the faster
[`chkor_vld()`](https://poissonconsulting.github.io/chk/dev/reference/chkor_vld.md).

## Usage

``` r
chkor(...)
```

## Arguments

- ...:

  Multiple `chk_` functions.

## Value

An informative error if the test fails.

## Details

**\[deprecated\]**

## See also

[`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)

## Examples

``` r
chkor()
#> Warning: `chkor()` was deprecated in chk 0.6.1.
#> ℹ Please use `chkor_vld()` instead.
chkor(chk_flag(TRUE))
try(chkor(chk_flag(1)))
#> Error in chkor(chk_flag(1)) : `1` must be a flag (TRUE or FALSE).
try(chkor(chk_flag(1), chk_flag(2)))
#> Error in chkor(chk_flag(1), chk_flag(2)) : 
#>   At least one of the following conditions must be met:
#> * `1` must be a flag (TRUE or FALSE).
#> * `2` must be a flag (TRUE or FALSE).
chkor(chk_flag(1), chk_flag(TRUE))
```
