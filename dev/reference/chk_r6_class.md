# Check Inherits from R6 Class

Checks inherits from R6 class using

`inherits(x, "R6") && inherits(x, class)`

## Usage

``` r
chk_r6_class(x, class, x_name = NULL)

vld_r6_class(x, class)
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

## Details

All R6 objects inherit from the class `'R6'`, so `chk_r6_class(x, "R6")`
checks that `x` is an R6 object of any class. R6 class generators (as
returned by
[`R6::R6Class()`](https://r6.r-lib.org/reference/R6Class.html)) are not
themselves R6 objects.

## Functions

- `vld_r6_class()`: Validate Inherits from R6 Class

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_class.md),
[`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md),
[`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md),
[`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md),
[`chk_s3_class_strict()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class_strict.md),
[`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)

## Examples

``` r
# chk_r6_class
chk_r6_class(R6::R6Class("exampleR6class")$new(), "exampleR6class")
try(chk_r6_class(1, "numeric"))
#> Error in eval(expr, envir) : 
#>   `1` must inherit from R6 class 'numeric', not S3 class 'numeric'.
# vld_r6_class
vld_r6_class(R6::R6Class("exampleR6class")$new(), "exampleR6class")
#> [1] TRUE
vld_r6_class(1, "numeric")
#> [1] FALSE
```
