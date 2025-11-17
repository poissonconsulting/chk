# Check File Exists

Checks if file exists using

`vld_string(x) && file.exists(x) && !dir.exists(x)`

## Usage

``` r
chk_file(x, x_name = NULL)

vld_file(x)
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

- `vld_file()`: Validate File Exists

## See also

[`vld_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md)

[`file.exists()`](https://rdrr.io/r/base/files.html)

[`dir.exists()`](https://rdrr.io/r/base/files2.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other file_checkers:
[`chk_dir()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dir.md),
[`chk_ext()`](https://poissonconsulting.github.io/chk/dev/reference/chk_ext.md)

## Examples

``` r
# chk_file
try(chk_file(tempfile()))
#> Error in eval(expr, envir) : 
#>   `tempfile()` must specify an existing file ('/tmp/RtmplqxsJw/file268366b338f' can't be found).
# vld_file
vld_file(tempfile())
#> [1] FALSE
```
