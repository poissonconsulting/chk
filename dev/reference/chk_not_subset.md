# Check Not Subset

Checks if not all values in values using

`!any(x %in% values) || !length(x)`

## Usage

``` r
chk_not_subset(x, values, x_name = NULL)
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

## See also

[`any()`](https://rdrr.io/r/base/any.html)

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other set_checkers:
[`chk_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_orderset.md),
[`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md),
[`vld_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md),
[`vld_orderset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_setequal.md)

## Examples

``` r
# chk_not_subset
chk_not_subset(11, 1:10)
try(chk_not_subset(1, 1:10))
#> Error in eval(expr, envir) : 
#>   `1` must not match 1, 2, 3, 4, 5, 6, 7, 8, 9 or 10.
```
