# Check Directories Exist

Checks if all directories exist (or if exists = FALSE do not exist as
directories or files).

## Usage

``` r
check_dirs(x, exists = TRUE, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- exists:

  A flag specifying whether the files/directories must (or must not)
  exist.

- x_name:

  A string of the name of object x or NULL.

## Value

An informative error if the test fails or an invisible copy of x.

## See also

Other check:
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md),
[`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md),
[`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
check_dirs(tempdir())
try(check_dirs(tempdir(), exists = FALSE))
#> Error in eval(expr, envir) : 
#>   `tempdir()` must not specify existing directories ('/tmp/RtmpxmlMRz' exists).
```
