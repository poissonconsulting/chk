# Check Compatible Lengths

Checks objects (including vectors) have lengths that could be 'strictly
recycled'. That is to say they must all be either zero length or the
same length with some of length 1.

## Usage

``` r
chk_compatible_lengths(..., x_name = NULL)

vld_compatible_lengths(...)
```

## Arguments

- ...:

  The objects to check for compatible lengths.

- x_name:

  A string of the name of object x or NULL.

## Value

The `chk_` function throws an informative error if the test fails.

## Details

This function helps to check vectors could be 'strictly recycled.' For
example the function will error if you had a vector of length 2 and
length 4, even though the vector of length 2 could be 'loosely recycled'
to match up to the vector of length 4 when combined.

The intent of the function is to check that only strict recycling is
occurring.

## Functions

- `vld_compatible_lengths()`: Validate Compatible Lengths

## See also

For more details about the use of this function, please read the article
[`vignette("chk-families")`](https://poissonconsulting.github.io/chk/dev/articles/chk-families.md).

Other length_checkers:
[`chk_length()`](https://poissonconsulting.github.io/chk/dev/reference/chk_length.md)

## Examples

``` r
# chk_compatible_lengths

a <- integer(0)
b <- numeric(0)
chk_compatible_lengths(a, b)

a <- 1
b <- 2
chk_compatible_lengths(a, b)

a <- 1:3
b <- 1:3
chk_compatible_lengths(a, b)

b <- 1
chk_compatible_lengths(a, b)

b <- 1:2
try(chk_compatible_lengths(a, b))
#> Error in eval(expr, envir) : 
#>   ... objects must be all zero length or the same length with some of length of 1 but not lengths 2 and 3.

b <- 1:6
try(chk_compatible_lengths(a, b))
#> Error in eval(expr, envir) : 
#>   ... objects must be all zero length or the same length with some of length of 1 but not lengths 3 and 6.
# vld_compatible_lengths

a <- integer(0)
b <- numeric(0)
vld_compatible_lengths(a, b)
#> [1] TRUE

a <- 1
b <- 2
vld_compatible_lengths(a, b)
#> [1] TRUE

a <- 1:3
b <- 1:3
vld_compatible_lengths(a, b)
#> [1] TRUE

b <- 1
vld_compatible_lengths(a, b)
#> [1] TRUE

b <- 1:2
vld_compatible_lengths(a, b)
#> [1] FALSE

b <- 1:6
vld_compatible_lengths(a, b)
#> [1] FALSE
```
