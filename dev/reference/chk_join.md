# Check Join

Checks if all rows in x match at least one in y.

## Usage

``` r
chk_join(x, y, by, x_name = NULL)

vld_join(x, y, by)
```

## Arguments

- x:

  The object to check.

- y:

  A data.frame with columns in by.

- by:

  A character vector specifying the column names to join x and y on. If
  named the names are the corresponding columns in x.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_join()`: Validate Join

## See also

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other misc_checkers:
[`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md),
[`chk_not_empty()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_empty.md),
[`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md)

## Examples

``` r
# chk_join
chk_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
try(chk_join(data.frame(z = 1), data.frame(z = 2), by = "z"))
#> Error in eval(expr, envir) : 
#>   All rows in `data.frame(z = 1)` must match at least one in the y object of class <df[,1]>.
#> Use `rlang::last_error()$y` to show the object compared to.
# vld_join
vld_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
#> [1] TRUE
vld_join(data.frame(z = 1), data.frame(z = 2), by = "z")
#> [1] FALSE
vld_join(data.frame(z = 1), data.frame(a = 1:2), by = c(z = "a"))
#> [1] TRUE
vld_join(data.frame(z = 1), data.frame(a = 2), by = c(z = "a"))
#> [1] FALSE
```
