# Check Data

Checks data.frame using

`inherits(x, "data.frame")`

Note that there is a similar function,
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md),
which checks the column names, values, number of rows, and keys of a
data.frame.

## Usage

``` r
chk_data(x, x_name = NULL)

vld_data(x)
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

- `vld_data()`: Validate Data

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md),
[`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md),
[`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)

## Examples

``` r
# chk_data
chk_data(data.frame(x = 1))
try(chk_data(1))
#> Error in eval(expr, envir) : `1` must be a data.frame.
# vld_data
vld_data(data.frame())
#> [1] TRUE
vld_data(data.frame(x = 1))
#> [1] TRUE
vld_data(c(x = 1))
#> [1] FALSE
```
