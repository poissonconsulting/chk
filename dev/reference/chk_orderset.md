# Check Set Ordered

Checks if the first occurrence of each shared element in x is equivalent
to the first occurrence of each shared element in values using
`vld_equivalent(unique(x[x %in% values]), values[values %in% x])`.

## Usage

``` r
chk_orderset(x, values, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- values:

  A vector of the permitted values.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails.

The `vld_` function returns a flag indicating whether the test was met.

## See also

[`vld_equivalent()`](https://poissonconsulting.github.io/chk/dev/reference/chk_equivalent.md)

[`unique()`](https://rdrr.io/r/base/unique.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other set_checkers:
[`chk_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_subset.md),
[`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md),
[`vld_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md),
[`vld_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_setequal.md)

## Examples

``` r
# chk_orderset
chk_orderset(1:2, 1:2)
try(chk_orderset(2:1, 1:2))
#> Error in eval(expr, envir) : 
#>   `2:1` must have (the first occurence of) each of the following elements in the following order: 1, 2.
```
