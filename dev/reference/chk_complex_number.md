# Check Complex Number

Checks if non-missing complex scalar using

`is.complex(x) && length(x) == 1L && !anyNA(x)`

## Usage

``` r
chk_complex_number(x, x_name = NULL)

vld_complex_number(x)
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

- `vld_complex_number()`: Validate Complex Number

## See also

[`is.integer()`](https://rdrr.io/r/base/integer.html)

[`vld_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

[`vld_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_number.md)

For more details about the use of this function, please read the article
[chk
families](https://poissonconsulting.github.io/chk/articles/chk-families.html).

Other scalar_checker:
[`chk_whole_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_number.md)

## Examples

``` r
# chk_complex_number
chk_complex_number(as.complex(1.1))
try(chk_complex_number(1.1))
#> Error in eval(expr, envir) : 
#>   `1.1` must be a complex number (non-missing complex scalar).
# vld_complex_number
vld_complex_number(as.complex(2))
#> [1] TRUE
```
