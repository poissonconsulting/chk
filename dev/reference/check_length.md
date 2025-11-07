# Check Length

Checks length of an object.

## Usage

``` r
check_length(x, values = numeric(0), x_name = NULL)
```

## Arguments

- x:

  The object to check.

- values:

  A flag or a whole numeric vector of the value, value range or possible
  values.

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
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
check_length(1)
try(check_length(1, values = FALSE))
#> Error in check_dim(x, values = values, x_name = x_name, dim_name = "length") : 
#>   `length(1)` must be equal to 0L.
#> Use `rlang::last_error()$y` to show the object compared to.
try(check_length(1, values = c(10, 2)))
#> Error in check_dim(x, values = values, x_name = x_name, dim_name = "length") : 
#>   `length(1)` must be between 2 and 10, not 1.
```
