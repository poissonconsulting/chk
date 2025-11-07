# Check Class

Checks inherits from class using

`inherits(x, class)`

## Usage

``` r
chk_is(x, class, x_name = NULL)

vld_is(x, class)
```

## Arguments

- x:

  The object to check.

- class:

  A character vector specifying the possible class values.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_is()`: Validate Inherits from Class

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md),
[`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md),
[`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)

## Examples

``` r
chk_is(1, "numeric")
try(chk_is(1L, "double"))
#> Error in eval(expr, envir) : `1L` must inherit from class 'double'.

# vld_is
vld_is(numeric(0), "numeric")
#> [1] TRUE
vld_is(1L, "double")
#> [1] FALSE
```
