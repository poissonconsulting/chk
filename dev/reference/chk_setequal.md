# Check Set Equal

Checks if equal set using

`setequal(x, values)`

## Usage

``` r
vld_orderset(x, values)

chk_setequal(x, values, x_name = NULL)

vld_setequal(x, values)
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

- `vld_orderset()`: Validate Set Ordered

- `vld_setequal()`: Validate Set Equal

## See also

[`setequal()`](https://rdrr.io/r/base/sets.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other set_checkers:
[`chk_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_subset.md),
[`chk_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_orderset.md),
[`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md),
[`vld_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md)

## Examples

``` r
# vld_orderset
vld_orderset(1, 1)
#> [1] TRUE
vld_orderset(1:2, 2:1)
#> [1] FALSE
vld_orderset(1, 2:1)
#> [1] TRUE
vld_orderset(1:2, 2)
#> [1] TRUE
# chk_setequal
chk_setequal(1:2, 2:1)
try(chk_setequal(1, 1:2))
#> Error in eval(expr, envir) : `1` must equal set: 1, 2.
# vld_setequal
vld_setequal(1, 1)
#> [1] TRUE
vld_setequal(1:2, 2:1)
#> [1] TRUE
vld_setequal(1, 2:1)
#> [1] FALSE
vld_setequal(1:2, 2)
#> [1] FALSE
```
