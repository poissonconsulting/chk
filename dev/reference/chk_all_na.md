# Check All Missing Values

Checks if all missing values using

`all(is.na(x))`

**Pass**: `NA`, `c(NA, NA)`, `logical(0)`.

**Fail**: `1`, `1:2`, `"1"`, `c(1, NA)`.

## Usage

``` r
chk_all_na(x, x_name = NULL)

vld_all_na(x)
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

- `vld_all_na()`: Validate All Missing Values

## See also

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other misc_checkers:
[`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md),
[`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md),
[`chk_not_empty()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_empty.md),
[`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md)

## Examples

``` r
# chk_all_na
try(chk_all_na(1))
#> Error in eval(expr, envir) : `1` must only have missing values.
try(chk_all_na(c(1, NA)))
#> Error in eval(expr, envir) : `c(1, NA)` must only have missing values.
chk_all_na(NA)
chk_all_na(c(NA, NA_character_, NA_real_))
# vld_all_na
vld_all_na(1)
#> [1] FALSE
vld_all_na(1:2)
#> [1] FALSE
vld_all_na(NA_real_)
#> [1] TRUE
vld_all_na(integer(0))
#> [1] TRUE
vld_all_na(c(NA, 1))
#> [1] FALSE
vld_all_na(TRUE)
#> [1] FALSE
vld_all_na(c(NA_real_, NA_character_))
#> [1] TRUE
```
