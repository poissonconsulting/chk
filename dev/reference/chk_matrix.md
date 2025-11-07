# Check Matrix

Checks if is a matrix using

`is.matrix(x)`

## Usage

``` r
chk_matrix(x, x_name = NULL)

vld_matrix(x)
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

- `vld_matrix()`: Validate Matrix

## See also

[`is.matrix()`](https://rdrr.io/r/base/matrix.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_structure_checkers:
[`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md),
[`chk_atomic()`](https://poissonconsulting.github.io/chk/dev/reference/chk_atomic.md),
[`chk_list()`](https://poissonconsulting.github.io/chk/dev/reference/chk_list.md),
[`chk_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)

## Examples

``` r
# chk_matrix
chk_matrix(matrix(1))
try(chk_matrix(array(1)))
#> Error in eval(expr, envir) : `array(1)` must be an matrix.
# vld_matrix
vld_matrix(1)
#> [1] FALSE
vld_matrix(matrix(1))
#> [1] TRUE
```
