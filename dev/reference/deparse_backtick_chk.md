# Deparse Backtick

`deparse_backtick_chk` is a wrapper on
[`deparse()`](https://rdrr.io/r/base/deparse.html) and `backtick_chk`.

## Usage

``` r
deparse_backtick_chk(x)

backtick_chk(x)

unbacktick_chk(x)
```

## Arguments

- x:

  A substituted object to deparse.

## Value

A string of the backticked substituted object.

## Details

It is exported to allow users to easily construct their own `chk_`
functions.

## Functions

- `backtick_chk()`: Backtick

- `unbacktick_chk()`: Unbacktick

## See also

[`deparse()`](https://rdrr.io/r/base/deparse.html)

## Examples

``` r
# deparse_backtick_chk
deparse_backtick_chk(2)
#> [1] "`2`"
deparse_backtick_chk(2^2)
#> [1] "`4`"
```
