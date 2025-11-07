# Check Array

Checks if is an array using

`is.array(x)`

## Usage

``` r
chk_array(x, x_name = NULL)

vld_array(x)
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

- `vld_array()`: Validate Array

## See also

[`is.array()`](https://rdrr.io/r/base/array.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_structure_checkers:
[`chk_atomic()`](https://poissonconsulting.github.io/chk/dev/reference/chk_atomic.md),
[`chk_list()`](https://poissonconsulting.github.io/chk/dev/reference/chk_list.md),
[`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md),
[`chk_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)

## Examples

``` r
# chk_array
chk_array(array(1))
try(chk_array(matrix(1)))

# vld_array
vld_array(1)
#> [1] FALSE
vld_array(array(1))
#> [1] TRUE
```
