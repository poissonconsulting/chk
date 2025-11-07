# Check Matches

Checks if all values match regular expression using

`all(grepl(regexp, x[!is.na(x)]))`

## Usage

``` r
chk_match(x, regexp = ".+", x_name = NULL)

vld_match(x, regexp = ".+")
```

## Arguments

- x:

  The object to check.

- regexp:

  A string of a regular expression.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Functions

- `vld_match()`: Validate Matches

## See also

[`all()`](https://rdrr.io/r/base/all.html)

[`grepl()`](https://rdrr.io/r/base/grep.html)

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

## Examples

``` r
# chk_match
chk_match("1")
try(chk_match("1", regexp = "2"))
#> Error in eval(expr, envir) : `"1"` must match regular expression '2'.
# vld_match
vld_match("1")
#> [1] TRUE
vld_match("a", regexp = "a")
#> [1] TRUE
vld_match("")
#> [1] FALSE
vld_match("1", regexp = "2")
#> [1] FALSE
vld_match(NA_character_, regexp = ".*")
#> [1] TRUE
```
