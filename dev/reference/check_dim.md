# Check Dimension

Checks dimension of an object.

## Usage

``` r
check_dim(x, dim = length, values = numeric(0), x_name = NULL, dim_name = NULL)
```

## Arguments

- x:

  The object to check.

- dim:

  A function returning a non-negative whole number of the dimension.

- values:

  A flag or a whole numeric vector of the value, value range or possible
  values.

- x_name:

  A string of the name of object x or NULL.

- dim_name:

  A string of the name of the dim function.

## Value

An informative error if the test fails or an invisible copy of x.

## See also

Other check:
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md),
[`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md),
[`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
check_dim(1)
try(check_dim(1, values = FALSE))
#> Error in check_dim(1, values = FALSE) : `length(1)` must be equal to 0L.
#> Use `rlang::last_error()$y` to show the object compared to.
try(check_dim(1, values = c(10, 2)))
#> Error in check_dim(1, values = c(10, 2)) : 
#>   `length(1)` must be between 2 and 10, not 1.
try(check_dim(data.frame(x = 1), dim = nrow, values = c(10, 10, 2)))
#> Error in check_dim(data.frame(x = 1), dim = nrow, values = c(10, 10, 2)) : 
#>   `nrow(data.frame(x = 1))` must match 2 or 10, not 1.
```
