# Check Unique

Checks if unique using

`!anyDuplicated(x, incomparables = incomparables)`

## Usage

``` r
chk_unique(x, incomparables = FALSE, x_name = NULL)

vld_unique(x, incomparables = FALSE)
```

## Arguments

- x:

  The object to check.

- incomparables:

  A vector of values that cannot be compared. FALSE means that all
  values can be compared.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_unique()`: Validate Unique

## See also

[`anyDuplicated()`](https://rdrr.io/r/base/duplicated.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other misc_checkers:
[`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md),
[`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md),
[`chk_not_empty()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_empty.md)

## Examples

``` r
# chk_unique
chk_unique(c(NA, 2))
try(chk_unique(c(NA, NA, 2)))
#> Error in eval(expr, envir) : `c(NA, NA, 2)` must be unique.
chk_unique(c(NA, NA, 2), incomparables = NA)
# vld_unique
vld_unique(NULL)
#> [1] TRUE
vld_unique(numeric(0))
#> [1] TRUE
vld_unique(c(NA, 2))
#> [1] TRUE
vld_unique(c(NA, NA, 2))
#> [1] FALSE
vld_unique(c(NA, NA, 2), incomparables = NA)
#> [1] TRUE
```
