# Check Sorted

Checks if is sorted using

`is.unsorted(x, na.rm = TRUE)`

## Usage

``` r
chk_sorted(x, x_name = NULL)

vld_sorted(x)
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

- `vld_sorted()`: Validate Sorted

## See also

[`is.unsorted()`](https://rdrr.io/r/base/is.unsorted.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

## Examples

``` r
# chk_sorted
chk_sorted(1:2)
try(chk_sorted(2:1))
#> Error in eval(expr, envir) : `2:1` must be sorted.
# vld_sorted
vld_sorted(1:2)
#> [1] TRUE
vld_sorted(2:1)
#> [1] FALSE
```
