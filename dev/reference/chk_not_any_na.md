# Check Not Any Missing Values

Checks if not any missing values using

`!anyNA(x)`

**Pass**: `1`, `1:2`, `"1"`, `logical(0)`.

**Fail**: `NA`, `c(1, NA)`.

## Usage

``` r
chk_not_any_na(x, x_name = NULL)

vld_not_any_na(x)
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

- `vld_not_any_na()`: Validate Not Any Missing Values

## See also

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other misc_checkers:
[`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md),
[`chk_not_empty()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_empty.md),
[`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md)

## Examples

``` r
# chk_not_any_na
chk_not_any_na(1)
try(chk_not_any_na(NA))
#> Error in eval(expr, envir) : `NA` must not have any missing values.
# vld_not_any_na
vld_not_any_na(1)
#> [1] TRUE
vld_not_any_na(1:2)
#> [1] TRUE
vld_not_any_na(NA_real_)
#> [1] FALSE
vld_not_any_na(integer(0))
#> [1] TRUE
vld_not_any_na(c(NA, 1))
#> [1] FALSE
vld_not_any_na(TRUE)
#> [1] TRUE
```
