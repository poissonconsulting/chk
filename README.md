
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chk

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/chk.svg?branch=master)](https://travis-ci.com/poissonconsulting/chk)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/chk?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/chk)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/chk/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/chk?branch=master)
[![License:
CC0](https://img.shields.io/badge/License-CC0-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![Tinyverse
status](https://tinyverse.netlify.com/badge/chk)](https://CRAN.R-project.org/package=chk)
[![CRAN
status](https://www.r-pkg.org/badges/version/chk)](https://cran.r-project.org/package=chk)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/chk)
<!-- badges: end -->

`chk` is an R package for developers to check user-supplied function
arguments.

It is designed to be simple, customizable and fast.

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

`chk` provides simple commonly used checks as (`chk_` functions) which
can be combined together for more complex checking.

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
chk_range(nrow(data), c(3,8))
#> Error: `nrow(data)` must be between 3 and 8, not 2.
chk_match(nrow(data), c(3,8))
#> Warning in grepl(regexp, x): argument 'pattern' has length > 1 and only the
#> first element will be used
#> Error: `nrow(data)` must match regular expression '38'.

chk_identical(data$x, 2:1)
#> Error: `data$x` not identical to: 2:1.

z <- "b"
chkor(chk_flag(z), chk_number(z))
#> Error: At least one of the following conditions must be met:
#> * `z` must be a flag (TRUE or FALSE).
#> * `z` must be a number (non-missing numeric scalar).
```

By default, each check returns TRUE if successful or throws an
informative error.

Error messages follow the [tidyverse style
guide](https://style.tidyverse.org/error-messages.html).

### Customizable

The functions are designed to be customizable.

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
[CC0](https://creativecommons.org/publicdomain/zero/1.0/) license. This
allows developers to copy and paste functions into their package which
is useful if they want to minimize their dependencies.

Copied functions should not be exported (to avoid namespace conflicts)
and the following creditation preserved.

``` r
#  License: CC
#  Repository: https://github.com/poissonconsulting/chk
```

### Fast

The functions are designed to be fast.

#### Check First

As exemplified by `chk_flag`, the `chk_` functions immediately evaluate
their object in one line of code and return TRUE if the check is
successful.

``` r
chk_flag
#> function(x, err = TRUE) {
#>   if(is.logical(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
#>   if(!err) return(FALSE)
#>   x_name <- deparse(substitute(x))
#>   err("`", x_name, "` must be a flag (TRUE or FALSE).")
#> }
#> <bytecode: 0x7fdcf123c878>
#> <environment: namespace:chk>
```

#### Minimal Checking

As they are not expected to be directly exposed to users the `chk_`
functions don’t check any of their arguments (other than the object of
interest of course\!).

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
  - [err](https://github.com/poissonconsulting/err/)
  - [testthat](https://github.com/r-lib/testthat/)

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/chk/issues).

[Pull requests](https://github.com/poissonconsulting/chk/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/chk/blob/master/CODE_OF_CONDUCT.md).
By contributing, you agree to abide by its terms.
