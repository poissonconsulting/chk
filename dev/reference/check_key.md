# Check Key

Checks if columns have unique rows.

## Usage

``` r
check_key(x, key = character(0), na_distinct = FALSE, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- key:

  A character vector of the columns that represent a unique key.

- na_distinct:

  A flag specifying whether missing values should be considered
  distinct.

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
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
x <- data.frame(x = c(1, 2), y = c(1, 1))
check_key(x)
try(check_key(x, "y"))
#> Error in eval(expr, envir) : Column 'y' in `x` must be a unique key.
```
