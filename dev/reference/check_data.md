# Check Data

Checks column names, values, number of rows and key for a data.frame.

## Usage

``` r
check_data(
  x,
  values = NULL,
  exclusive = FALSE,
  order = FALSE,
  nrow = numeric(0),
  key = character(0),
  x_name = NULL
)
```

## Arguments

- x:

  The object to check.

- values:

  A uniquely named list of atomic vectors of the column values.

- exclusive:

  A flag specifying whether x must only include columns named in values.

- order:

  A flag specifying whether the order of columns in x must match names
  in values.

- nrow:

  A flag or a whole numeric vector of the value, value range or possible
  values.

- key:

  A character vector of the columns that represent a unique key.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails or an invisible copy of x.

## See also

Other check:
[`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md),
[`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md),
[`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
check_data(data.frame())
check_data(data.frame(x = 2), list(x = 1))
try(check_data(data.frame(x = 2), list(y = 1L)))
#> Error in check_data(data.frame(x = 2), list(y = 1L)) : 
#>   `names(data.frame(x = 2))` must include 'y'.
try(check_data(data.frame(x = 2), list(y = 1)))
#> Error in check_data(data.frame(x = 2), list(y = 1)) : 
#>   `names(data.frame(x = 2))` must include 'y'.
try(check_data(data.frame(x = 2), nrow = 2))
#> Error in check_dim(x, dim = base::nrow, values = nrow, x_name = x_name,  : 
#>   `nrow(data.frame(x = 2))` must be equal to 2.
#> Use `rlang::last_error()$y` to show the object compared to.
```
