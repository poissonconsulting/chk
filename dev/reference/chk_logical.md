# Check Logical

Checks if logical using

`is.logical(x)`

If you want to check if it is a scalar, meaning that in addition to
being of logical type, it has `length(x) == 1`, you should use
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md)

## Usage

``` r
chk_logical(x, x_name = NULL)

vld_logical(x)
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

- `vld_logical()`: Validate Logical

## See also

[`is.logical()`](https://rdrr.io/r/base/logical.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other logical_checkers:
[`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md),
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md),
[`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md),
[`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)

Other data_type_checkers:
[`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md),
[`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md),
[`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md),
[`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md),
[`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md),
[`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md),
[`chk_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_numeric.md),
[`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)

## Examples

``` r
# chk_logical
chk_logical(TRUE)
try(chk_logical(1))
#> Error in eval(expr, envir) : `1` must be logical.
# vld_logical
vld_logical(TRUE)
#> [1] TRUE
vld_logical(matrix(TRUE))
#> [1] TRUE
vld_logical(logical(0))
#> [1] TRUE
vld_logical(NA)
#> [1] TRUE
vld_logical(1)
#> [1] FALSE
vld_logical("TRUE")
#> [1] FALSE
```
