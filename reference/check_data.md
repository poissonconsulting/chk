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

## Details

The values of each column are checked using
[`check_values()`](https://poissonconsulting.github.io/chk/reference/check_values.md).
See its details for the rules including those for factor levels and
missing values.

`values` is reduced with
[`unique()`](https://rdrr.io/r/base/unique.html), so a column whose
class lacks a correct [`unique()`](https://rdrr.io/r/base/unique.html)
method is checked against the wrong values. In particular
[`unique()`](https://rdrr.io/r/base/unique.html) on a `lubridate`
`Period` vector discards everything but the seconds, which collapses
`values` and silently changes the check applied (see
<https://github.com/tidyverse/lubridate/issues/1154>). Either define
`unique.Period()` in your own code or convert the column and `values` to
a class with a correct [`unique()`](https://rdrr.io/r/base/unique.html)
method, such as the number of seconds with
`as.numeric(lubridate::as.duration(x))`.

## See also

Other check:
[`check_dim()`](https://poissonconsulting.github.io/chk/reference/check_dim.md),
[`check_dirs()`](https://poissonconsulting.github.io/chk/reference/check_dirs.md),
[`check_files()`](https://poissonconsulting.github.io/chk/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/reference/check_values.md)

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
