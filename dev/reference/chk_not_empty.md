# Check Not Empty

Checks if not empty using

`length(x) != 0L`

**Pass**: `1`, `1:2`, `NA`, `matrix(1:3)`, `list(1)`,
`data.frame(x = 1)`.

**Fail**: `NULL`, `logical(0)`,
[`list()`](https://rdrr.io/r/base/list.html),
[`data.frame()`](https://rdrr.io/r/base/data.frame.html).

## Usage

``` r
chk_not_empty(x, x_name = NULL)

vld_not_empty(x)
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

- `vld_not_empty()`: Validate Not Empty

## See also

[`length()`](https://rdrr.io/r/base/length.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other misc_checkers:
[`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md),
[`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md),
[`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md)

## Examples

``` r
# chk_not_empty
chk_not_empty(1)
try(chk_not_empty(numeric(0)))
#> Error in eval(expr, envir) : 
#>   `numeric(0)` must not be empty (zero length).
# vld_not_empty
vld_not_empty(1)
#> [1] TRUE
vld_not_empty(matrix(1:3))
#> [1] TRUE
vld_not_empty(character(0))
#> [1] FALSE
vld_not_empty(list(1))
#> [1] TRUE
vld_not_empty(NULL)
#> [1] FALSE
vld_not_empty(list())
#> [1] FALSE
```
