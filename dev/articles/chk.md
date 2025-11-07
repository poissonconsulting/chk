# Get Started with chk

## Introduction

R functions and packages are great for sharing code, but it’s hard to
predict how end-users will implement them. Users might pass inputs that
your function wasn’t designed to handle, leading to incorrect results or
errors. For example, if a function expects a numeric vector (e.g.,
`c(1, 2, 3)`) but receives a character vector (e.g.,`c("1", "2", "3")`),
it may return an error.

The `chk` package provides a set of functions that check user-provided
arguments and deliver meaningful error messages to guide users when
something goes wrong. Including `chk`’s specially designed functions
when developing your R package will help improve user experience,
prevent errors, and make your code more robust by ensuring consistent
behavior across different inputs. This enhances the reliability and
reusability of your code.

Additionally, it can help with performance optimization by ensuring that
your functions receive inputs of the appropriate size, thereby avoiding
time-consuming calculations.

## Goal

`chk` is an R package for developers to check user-supplied function
arguments.

It is designed to be simple, customizable and fast.

## `chk` Functions

Based on the function prefixes, we can classify `chk` functions into
three categories:

1.  `chk_` Functions
2.  `vld_` Functions
3.  `check_` Functions

### 1. `chk_` Functions

`chk_` functions check the properties of individual objects. For
example, `chk_flag(x)` checks whether `x` is a flag, i.e., a non-missing
logical vector of length 1.

`chk_` functions are called for their side-effects, i.e., they throw an
informative error if the object fails the check. Although do return an
invisible copy of the first argument so they can be used in pipes.

``` r
library(chk)
y <- TRUE
chk_flag(y)
y <- NA
chk_flag(y)
#> Error:
#> ! `y` must be a flag (TRUE or FALSE).
```

The error messages, which follow the [tidyverse style
guide](https://style.tidyverse.org/errors.html), are designed to allow
the user to quickly identify the problem with the argument value(s) they
are providing. The errors are [rlang
errors](https://rlang.r-lib.org/reference/abort.html) of subclass
`'chk_error'`.

### 2. `vld_` Functions

Each `chk_` function has a matching `vld_` function which returns a flag
indicating whether the object passed the check.

``` r
vld_flag(TRUE)
#> [1] TRUE
vld_flag(NA)
#> [1] FALSE
```

The `vld_` functions allow developers to provide their own error
messages.

``` r
if (!vld_flag(NA)) abort_chk("`NA` is not TRUE or FALSE!!")
#> Error:
#> ! `NA` is not TRUE or FALSE!!
```

### 3. `check_` Functions

The `check_` functions are more complex then the `chk_` functions which
make them slower but makes doing some general tests easier.

## Using chk

The `chk_` functions are designed to be used within functions.
Consequently, when constructing an error message they use the name of
the object that they received as this is expected to be the name of the
argument.

``` r
fun1 <- function(x) {
  chk_whole_number(x)
  # use x
}

fun1(1)
y <- 1.3
fun1(x = y)
#> Error in `fun1()`:
#> ! `x` must be a whole number (non-missing integer scalar or double equivalent).
```

If this is not the case, developers can provide a different name using
the `x_name` argument.

``` r
x <- NA
chk_flag(x, x_name = "`zzz`")
#> Error:
#> ! `zzz` must be a flag (TRUE or FALSE).
```

**IMPORTANT NOTE**

As the `chk_` (and `vld_`) functions are not expected to be directly
exposed to users they don’t check any of their arguments (other than the
object of interest of course!) to ensure that they are as fast as
possible.

## Extending chk

The
[`chk_flag()`](https://poissonconsulting.github.io/chk/dev/reference/chk_flag.md)
function illustrates the general structure of a `chk_` function.

``` r
chk_flag
#> function(x, x_name = NULL){
#>   if(vld_flag(x)) return(invisible(x))
#>   if(is.null(x_name))  x_name <- deparse_backtick_chk(substitute(x))
#>   abort_chk(x_name, " must be a flag (TRUE or FALSE)")
#> }
#> <bytecode: 0x7fe802835670>
#> <environment: namespace:chk>
```

A `chk_` function initially checks the object (using its `vld_` partner)
and if the object passes the check immediately returns an invisible copy
of the object. If, and only if, the object fails the check does the
`chk_` function construct and then throw an informative error message.

The
[`deparse_backtick_chk()`](https://poissonconsulting.github.io/chk/dev/reference/deparse_backtick_chk.md)
and
[`abort_chk()`](https://poissonconsulting.github.io/chk/dev/reference/abort_chk.md)
functions are exported to make it easy for programmers to develop their
own `chk_` functions. The
[chk-lgl.R](https://github.com/poissonconsulting/chk/blob/master/R/chk-lgl.R)
script illustrates the general template to use when developing your own
`chk_` functions.

### `abort_chk()`

The
[`abort_chk()`](https://poissonconsulting.github.io/chk/dev/reference/abort_chk.md)
function converts multiple arguments to a string using
`paste0(..., collapse = '')` and provides number sensitive
`sprintf`-like types. By default it also capitalizes the first character
and adds a missing period.

``` r
abort_chk("There %r %n problem director%y%s.", n = 1)
#> Error:
#> ! There is 1 problem directory.
abort_chk("there %r %n ", "problem director%y%s", n = 2)
#> Error:
#> ! There are 2 problem directories.
```
