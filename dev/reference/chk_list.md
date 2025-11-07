# Check List

Checks if is a list using

`is.list(x)`

## Usage

``` r
chk_list(x, x_name = NULL)

vld_list(x)
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

- `vld_list()`: Validate List

## See also

[`is.list()`](https://rdrr.io/r/base/list.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_structure_checkers:
[`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md),
[`chk_atomic()`](https://poissonconsulting.github.io/chk/dev/reference/chk_atomic.md),
[`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md),
[`chk_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)

## Examples

``` r
# chk_list
chk_list(list())
try(chk_list(1))
#> Error in eval(expr, envir) : `1` must be a list.
# vld_list
vld_list(list())
#> [1] TRUE
vld_list(list(x = 1))
#> [1] TRUE
vld_list(mtcars)
#> [1] TRUE
vld_list(1)
#> [1] FALSE
vld_list(NULL)
#> [1] FALSE
```
