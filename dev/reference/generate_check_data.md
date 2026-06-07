# Generate `check_data()` Code

Generates the code for a
[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md)
call from an example data frame so the column specification does not
have to be written out by hand.

## Usage

``` r
generate_check_data(x, data_name = NULL)
```

## Arguments

- x:

  A data frame to generate the
  [`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md)
  code from.

- data_name:

  A string of the name to use for the data frame in the generated code
  or NULL to use the name of `x`.

## Value

A string of the generated code, invisibly.

## Details

For each column the generated `values` entry captures

- the column's class,

- whether it permits missing values,

- the range (minimum and maximum) of numeric, Date and POSIXct columns,
  and

- the levels of factors.

The result is a starting point that is expected to be edited, for
example to widen a range or relax a set of factor levels. The code is
printed to the console (so it can be copied) and returned invisibly as a
string.

## See also

[`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md)

## Examples

``` r
data <- data.frame(
  count = c(1L, 3L, NA),
  letter = c("a", "b", "c"),
  height = c(1.5, 2.5, 3.5)
)
generate_check_data(data)
#> check_data(
#>   data,
#>   values = list(
#>     count = c(1L, 3L, NA),
#>     letter = "a",
#>     height = c(1.5, 3.5)
#>   )
#> )
```
