# Check Directory Exists

Checks if directory exists using

`vld_string(x) && dir.exists(x)`

## Usage

``` r
chk_dir(x, x_name = NULL)

vld_dir(x)
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

- `vld_dir()`: Validate Directory Exists

## See also

[`vld_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md)

[`dir.exists()`](https://rdrr.io/r/base/files2.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other file_checkers:
[`chk_ext()`](https://poissonconsulting.github.io/chk/dev/reference/chk_ext.md),
[`chk_file()`](https://poissonconsulting.github.io/chk/dev/reference/chk_file.md)

## Examples

``` r
# chk_dir
chk_dir(tempdir())
try(chk_dir(tempfile()))
#> Error in eval(expr, envir) : 
#>   `tempfile()` must specify an existing directory ('/tmp/Rtmp7QEjBP/file2e22381870ad' can't be found).
# vld_dir
vld_dir(1)
#> [1] FALSE
vld_dir(tempdir())
#> [1] TRUE
vld_dir(tempfile())
#> [1] FALSE
```
