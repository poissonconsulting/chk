# Check Files Exist

Checks if all files exist (or if exists = FALSE do not exist as files or
directories).

## Usage

``` r
check_files(x, exists = TRUE, x_name = NULL)
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
[`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md),
[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md),
[`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md),
[`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md),
[`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)

## Examples

``` r
check_files(tempfile("unlikely-that-exists-chk"), exists = FALSE)
try(check_files(tempfile("unlikely-that-exists-chk")))
#> Error in eval(expr, envir) : 
#>   `tempfile("unlikely-that-exists-chk")` must specify existing files ('/tmp/RtmpbFAzF1/unlikely-that-exists-chk27f77c580fd2' can't be found).
```
