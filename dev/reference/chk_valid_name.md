# Check Valid Name

Checks if valid name using

`identical(make.names(x[!is.na(x)]), as.character(x[!is.na(x)]))`

## Usage

``` r
chk_valid_name(x, x_name = NULL)

vld_valid_name(x)
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

- `vld_valid_name()`: Validate Valid Name

## See also

[`identical()`](https://rdrr.io/r/base/identical.html)

[`make.names()`](https://rdrr.io/r/base/make.names.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other name_checkers:
[`chk_named()`](https://poissonconsulting.github.io/chk/dev/reference/chk_named.md)

## Examples

``` r
# chk_valid_name
chk_valid_name("text")
try(chk_valid_name(".1"))
#> Error in eval(expr, envir) : `".1"` must be valid name.
# vld_valid_name
vld_valid_name(".1")
#> [1] FALSE
```
