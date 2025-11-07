# Check Names

Checks the names of an object.

## Usage

``` r
check_names(
  x,
  names = character(0),
  exclusive = FALSE,
  order = FALSE,
  x_name = NULL
)
```

## Arguments

- x:

  The object to check.

- names:

  A character vector of the required names.

- exclusive:

  A flag specifying whether x must only contain the required names.

- order:

  A flag specifying whether the order of the required names in x must
  match the order in names.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails or an invisible copy of x.

## See also

Other check:
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md),
[`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md),
[`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md),
[`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
x <- c(x = 1, y = 2)
check_names(x, c("y", "x"))
try(check_names(x, c("y", "x"), order = TRUE))
#> Error in eval(expr, envir) : 
#>   `names(x)` must include 'y' and 'x' in that order.
try(check_names(x, "x", exclusive = TRUE))
#> Error in eval(expr, envir) : `names(x)` must not include 'y'.
```
