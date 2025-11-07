# Check File Extension

Checks extension using

`vld_string(x) && vld_subset(tools::file_ext(x), ext)`

The user may want to use
[`toupper()`](https://rdrr.io/r/base/chartr.html) or
[`tolower()`](https://rdrr.io/r/base/chartr.html) to ensure the case
matches.

## Usage

``` r
chk_ext(x, ext, x_name = NULL)

vld_ext(x, ext)
```

## Arguments

- x:

  The object to check.

- ext:

  A character vector of the permitted file extensions (without the .).

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_ext()`: Validate File Extension

## See also

[`vld_string()`](https://poissonconsulting.github.io/chk/dev/reference/chk_string.md)

[`vld_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other file_checkers:
[`chk_dir()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dir.md),
[`chk_file()`](https://poissonconsulting.github.io/chk/dev/reference/chk_file.md)

## Examples

``` r
# chk_ext
try(chk_ext("file1.pdf", "png"))
#> Error in eval(expr, envir) : 
#>   `"file1.pdf"` must have extension 'png' (not 'pdf').
# vld_ext
vld_ext("oeu.pdf", "pdf")
#> [1] TRUE
vld_ext(toupper("oeu.pdf"), "PDF")
#> [1] TRUE
```
