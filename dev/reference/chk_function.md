# Check Function

Checks if is a function using

`is.function(x) && (is.null(formals) || length(formals(x)) == formals)`

## Usage

``` r
chk_function(x, formals = NULL, x_name = NULL)

vld_function(x, formals = NULL)
```

## Arguments

- x:

  The object to check.

- formals:

  A count of the number of formal arguments.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_function()`: Validate Function

## See also

[`is.function()`](https://rdrr.io/r/base/is.function.html)
[`formals()`](https://rdrr.io/r/base/formals.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other missing_checkers:
[`chk_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_missing.md),
[`chk_not_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_missing.md)

## Examples

``` r
# chk_function
chk_function(mean)
try(chk_function(1))
#> Error in eval(expr, envir) : `1` must be a function.
# vld_function
vld_function(mean)
#> [1] TRUE
vld_function(function(x) x)
#> [1] TRUE
vld_function(1)
#> [1] FALSE
vld_function(list(1))
#> [1] FALSE
```
