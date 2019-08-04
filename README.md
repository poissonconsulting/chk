
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chk

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.com/poissonconsulting/chk.svg?branch=master)](https://travis-ci.com/poissonconsulting/chk)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/chk?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/chk)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/chk/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/chk?branch=master)
[![License:
CC0](https://img.shields.io/badge/License-CC0-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
<!-- badges: end -->

`chk` is an R package for developers to check user-supplied function
arguments.

It is designed to be simple, customisable and fast.

## Installation

To install the latest release version from
[CRAN](https://cran.r-project.org)

``` r
install.packages("chk")
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/chk)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/chk")
```

## Demonstration

### Simple

`chk` provides simple commonly used checks which can be combined
together for more complex checking.

``` r
library(chk)

y <- "a"

chk_flag(y)
#> Error: `y` must be a flag (TRUE or FALSE).
chk_string(y)
#> [1] TRUE

data <- data.frame(x = 1:2)
chk_is(data, "data.frame")
#> [1] TRUE
chk_match(nrow(data), c(3,8))
#> Error: `nrow(data)` must be between 3 and 8, not 2.

chk_match(data$x, c(2,4,8,NA))
#> Error: All values of `data$x` must be 2, 4, 8 or NA.

z <- "b"
chkor(chk_flag(z), chk_number(z))
#> Error: At least one of the following conditions must be met:
#> * `z` must be a flag (TRUE or FALSE).
#> * `z` must be a number (non-missing numeric scalar).
chkor(chk_flag(z), chk_string(z))
#> [1] TRUE
```

By default, each check returns TRUE if successful or throws an
informative error.

Error messages follow the [tidyverse style
guide](https://style.tidyverse.org/error-messages.html).

### Customisable

The functions are designed to be customisable.

#### Custom Error Messages

If `err = FALSE` a check returns FALSE (instead of throwing an error) on
check failure.

``` r
chk_flag(1, err = FALSE)
#> [1] FALSE
```

This allows developers to provide their own error messages.

``` r
if(!chk_flag(1, err = FALSE)) stop("x MUST be a flag (try as.logical())")
#> Error in eval(expr, envir, enclos): x MUST be a flag (try as.logical())
```

#### Copy and Paste

`chk` is released under the
[CC0](https://creativecommons.org/publicdomain/zero/1.0/) licence and
most `chk` functions are standalone. This allows developers to easily
copy and paste individual functions into their package which is useful
if they want to minimise their dependencies. Copied functions should not
be exported (to avoid namespace conflicts) and the following creditation
preserved.

``` r
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
```

### Fast

The functions are designed to be fast.

#### Minimal Checking

As they are not expected to be directly exposed to users the `chk`
functions don’t check any of their inputs (other than the first argument
of course\!).

#### Turn Off Checking

If a function is being called internally the checks can be turned off as
follows

``` r
fun <- function(x, ...) {
  if(is_chk_on()) {
    chk_flag(x)
    chk_unused(...)
  }
  x
}

wrapper_on_fun <- function(x) {
  if(is_chk_on()) {
    chk_off()
    on.exit(chk_on())
  }
  fun(x)
}

fun(FALSE) # calls fun with checking as being called by user
#> [1] FALSE
wrapper_on_fun(FALSE) # calls fun without checking as being used internally
#> [1] FALSE
```

It is only worth doing this if the checks are substantially slower than
the time required to test and turn checking on and off (see
[Benchmarking
chk](https://poissonconsulting.github.io/chk/articles/benchmarking-chk.html))

## Inspiration

  - [datacheckr](https://github.com/poissonconsulting/datacheckr/)
  - [checkr](https://github.com/poissonconsulting/checkr/)
  - [testthat](https://github.com/r-lib/testthat/)

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/chk/issues).

[Pull requests](https://github.com/poissonconsulting/chk/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/chk/blob/master/CODE_OF_CONDUCT.md).
By contributing, you agree to abide by its terms
