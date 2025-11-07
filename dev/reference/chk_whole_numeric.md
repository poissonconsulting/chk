# Check Whole Numeric

Checks if integer vector or double equivalent using

`is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))`

## Usage

``` r
chk_whole_numeric(x, x_name = NULL)

vld_whole_numeric(x)
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

- `vld_whole_numeric()`: Validate Whole Numeric

## See also

[`is.integer()`](https://rdrr.io/r/base/integer.html)

[`is.double()`](https://rdrr.io/r/base/double.html)

[`vld_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

[`all.equal()`](https://rdrr.io/r/base/all.equal.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other whole_number_checkers:
[`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
[`chk_whole_number()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_number.md)

## Examples

``` r
# chk_whole_numeric
chk_whole_numeric(1)
try(chk_whole_numeric(1.1))
#> Error in eval(expr, envir) : 
#>   `1.1` must be a whole numeric vector (integer vector or double equivalent).
# vld_whole_numeric
vld_whole_numeric(1)
#> [1] TRUE
vld_whole_numeric(NA_real_)
#> [1] TRUE
vld_whole_numeric(1:2)
#> [1] TRUE
vld_whole_numeric(double(0))
#> [1] TRUE
vld_whole_numeric(TRUE)
#> [1] FALSE
vld_whole_numeric(1.5)
#> [1] FALSE
```
