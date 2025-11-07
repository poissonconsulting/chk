# Check Superset

Checks if includes all values using

`all(values %in% x)`

Pay attention to the order of the arguments `value` and `x` in this
function compared to
[`chk_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md)

## Usage

``` r
chk_superset(x, values, x_name = NULL)

vld_superset(x, values)
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

- `vld_superset()`: Validates Superset

## See also

[`all()`](https://rdrr.io/r/base/all.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other set_checkers:
[`chk_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_subset.md),
[`chk_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_orderset.md),
[`vld_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md),
[`vld_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_setequal.md)

## Examples

``` r
# chk_superset
chk_superset(1:3, 1)
try(chk_superset(1:3, 4))
#> Error in eval(expr, envir) : `1:3` must include 4.
# vld_superset
vld_superset(1:3, 1)
#> [1] TRUE
vld_superset(1:3, 4)
#> [1] FALSE
vld_superset(integer(0), integer(0))
#> [1] TRUE
```
