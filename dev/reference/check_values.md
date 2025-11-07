# Check Values and Class

Checks values and S3 class of an atomic object.

## Usage

``` r
check_values(x, values, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- values:

  An atomic vector specifying the S3 class and possible values.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails or an invisible copy of x.

## Details

To check the class simply pass a vector of the desired class.

To check that x does not include missing values pass a single
non-missing value (of the correct class).

To allow it to include missing values include a missing value.

To check that it only includes missing values only pass a missing value
(of the correct class).

To check the range of the values in x pass two non-missing values (as
well as the missing value if required).

To check that x only includes specific values pass three or more
non-missing values.

In the case of a factor ensure values has two levels to check that the
levels of x are an ordered superset of the levels of value and three or
more levels to check that they are identical.

## See also

Other check:
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md),
[`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md),
[`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md),
[`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md)

## Examples

``` r
check_values(1, numeric(0))
check_values(1, 2)
try(check_values(1, 1L))
#> Error in check_values(1, 1L) : `1` must inherit from S3 class 'integer'.
try(check_values(NA_real_, 1))
#> Error in check_values(NA_real_, 1) : 
#>   `NA_real_` must not have any missing values.
```
