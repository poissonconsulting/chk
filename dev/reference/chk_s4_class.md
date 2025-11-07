# Check Inherits from S4 Class

Checks inherits from S4 class using

`isS4(x) && methods::is(x, class)`

## Usage

``` r
chk_s4_class(x, class, x_name = NULL)

vld_s4_class(x, class)
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

- `vld_s4_class()`: Validate Inherits from S4 Class

## See also

[`methods::is()`](https://rdrr.io/r/methods/is.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md),
[`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md),
[`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md)

## Examples

``` r
# chk_s4_class
try(chk_s4_class(1, "numeric"))
#> Error in eval(expr, envir) : `1` must inherit from S4 class 'numeric'.
chk_s4_class(getClass("MethodDefinition"), "classRepresentation")
# vld_s4_class
vld_s4_class(numeric(0), "numeric")
#> [1] FALSE
vld_s4_class(getClass("MethodDefinition"), "classRepresentation")
#> [1] TRUE
```
