# Check Vector

Checks if is a vector using

`(is.atomic(x) && !is.matrix(x) && !is.array(x)) || is.list(x)`

## Usage

``` r
chk_vector(x, x_name = NULL)

vld_vector(x)
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

## Details

`is.vector(x)` is not reliable because it returns TRUE only if the
object is a vector with no attributes apart from names.

## Functions

- `vld_vector()`: Validate Vector

## See also

[`is.atomic()`](https://rdrr.io/r/base/is.recursive.html),
[`is.matrix()`](https://rdrr.io/r/base/matrix.html),
[`is.array()`](https://rdrr.io/r/base/array.html),
[`is.list()`](https://rdrr.io/r/base/list.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_structure_checkers:
[`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md),
[`chk_atomic()`](https://poissonconsulting.github.io/chk/dev/reference/chk_atomic.md),
[`chk_list()`](https://poissonconsulting.github.io/chk/dev/reference/chk_list.md),
[`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md)

## Examples

``` r
# chk_vector
chk_vector(1)
chk_vector(list())
try(chk_vector(matrix(1)))
#> Error in eval(expr, envir) : `matrix(1)` must be a vector.
# vld_vector
vld_vector(1)
#> [1] TRUE
```
