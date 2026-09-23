# Check Inherits from S7 Class

Checks inherits from S7 class using

`inherits(x, "S7_object") && inherits(x, class)`

## Usage

``` r
chk_s7_class(x, class, x_name = NULL)

vld_s7_class(x, class)
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

All S7 objects inherit from the class `'S7_object'`, so
`chk_s7_class(x, "S7_object")` checks that `x` is an S7 object of any
class.

S7 is self-describing, so an S7 class generator (as returned by
[`S7::new_class()`](https://rconsortium.github.io/S7/reference/new_class.html))
is itself an S7 object, of class `'S7_class'`. It is not an object of
the class it generates.

`class` is a character vector of class names matching those in
`class(x)`. S7 qualifies class names with the package they are defined
in, so an S7 class defined in package `foo` is matched by
`'foo::ClassName'` and not by `'ClassName'`. S7 class objects are not
accepted as `class`.

## Functions

- `vld_s7_class()`: Validate Inherits from S7 Class

## See also

[`inherits()`](https://rdrr.io/r/base/class.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other id_checkers:
[`chk_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_class.md),
[`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md),
[`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md),
[`chk_r6_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_r6_class.md),
[`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md),
[`chk_s3_class_strict()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class_strict.md),
[`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)

## Examples

``` r
# chk_s7_class
Foo <- S7::new_class("Foo", package = "mypkg")
chk_s7_class(Foo(), "mypkg::Foo")
try(chk_s7_class(1, "numeric"))
#> Error in eval(expr, envir) : 
#>   `1` must inherit from S7 class 'numeric', not S3 class 'numeric'.
# vld_s7_class
Foo <- S7::new_class("Foo", package = "mypkg")
vld_s7_class(Foo(), "mypkg::Foo")
#> [1] TRUE
vld_s7_class(1, "numeric")
#> [1] FALSE
```
