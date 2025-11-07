# Check Atomic

Checks if atomic using

`is.atomic(x)`

## Usage

``` r
chk_atomic(x, x_name = NULL)

vld_atomic(x)
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

- `vld_atomic()`: Validate Atomic

## See also

[`is.atomic()`](https://rdrr.io/r/base/is.recursive.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other data_structure_checkers:
[`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md),
[`chk_list()`](https://poissonconsulting.github.io/chk/dev/reference/chk_list.md),
[`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md),
[`chk_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)

## Examples

``` r
# chk_atomic
chk_atomic(1)
try(chk_atomic(list(1)))
#> Error in eval(expr, envir) : `list(1)` must be atomic.
# vld_atomic
vld_atomic(1)
#> [1] TRUE
vld_atomic(matrix(1:3))
#> [1] TRUE
vld_atomic(character(0))
#> [1] TRUE
vld_atomic(list(1))
#> [1] FALSE
vld_atomic(NULL)
#> [1] FALSE
```
