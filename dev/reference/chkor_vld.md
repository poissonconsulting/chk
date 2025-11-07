# Chk OR

Chk OR

## Usage

``` r
chkor_vld(...)
```

## Arguments

- ...:

  Multiple `vld_` calls.

  A common mistake is to pass `chk_` calls.

  `chkor_vld()` is relatively slow. If at all possible use
  [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)
  or first test using the individual `vld_` functions and then call
  `chkor_vld()` to generate an informative error message.

## Value

An informative error if the test fails.

## See also

[`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)

## Examples

``` r
chkor_vld()
chkor_vld(vld_flag(TRUE))
try(chkor_vld(vld_flag(1)))
#> Error in chkor_vld(vld_flag(1)) : `1` must be a flag (TRUE or FALSE).
try(chkor_vld(vld_flag(1), vld_flag(2)))
#> Error in chkor_vld(vld_flag(1), vld_flag(2)) : 
#>   At least one of the following conditions must be met:
#> * `1` must be a flag (TRUE or FALSE).
#> * `2` must be a flag (TRUE or FALSE).
chkor_vld(vld_flag(1), vld_flag(TRUE))
```
