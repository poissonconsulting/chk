# Check Type

Checks inherits from S3 class using

`!isS4(x) && inherits(x, class)`

## Usage

``` r
chk_s3_class(x, class, x_name = NULL)

vld_s3_class(x, class)
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

- `vld_s3_class()`: Validate Inherits from S3 Class

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md),
[`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md),
[`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)

## Examples

``` r
# chk_s3_class
chk_s3_class(1, "numeric")
try(chk_s3_class(getClass("MethodDefinition"), "classRepresentation"))
#> Error in eval(expr, envir) : 
#>   `getClass("MethodDefinition")` must inherit from S3 class 'classRepresentation'.
# vld_s3_class
vld_s3_class(numeric(0), "numeric")
#> [1] TRUE
vld_s3_class(getClass("MethodDefinition"), "classRepresentation")
#> [1] FALSE
```
