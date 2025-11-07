# Check Subset

Checks if all values in values using

`all(x %in% values)`

Pay attention to the order of the arguments `value` and `x` in this
function compared to
[`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md)

## Usage

``` r
vld_not_subset(x, values)

chk_subset(x, values, x_name = NULL)

vld_subset(x, values)
```

## Arguments

- x:

  The object to check.

- values:

  A vector of the permitted values.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_not_subset()`: Validate Not Subset

- `vld_subset()`: Validate Subset

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other set_checkers:
[`chk_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_subset.md),
[`chk_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_orderset.md),
[`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md),
[`vld_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_setequal.md)

## Examples

``` r
# vld_not_subset
vld_not_subset(numeric(0), 1:10)
#> [1] TRUE
vld_not_subset(1, 1:10)
#> [1] FALSE
vld_not_subset(11, 1:10)
#> [1] TRUE
# chk_subset
chk_subset(1, 1:10)
try(chk_subset(11, 1:10))
#> Error in eval(expr, envir) : 
#>   `11` must match 1, 2, 3, 4, 5, 6, 7, 8, 9 or 10, not 11.
# vld_subset
vld_subset(numeric(0), 1:10)
#> [1] TRUE
vld_subset(1, 1:10)
#> [1] TRUE
vld_subset(11, 1:10)
#> [1] FALSE
```
