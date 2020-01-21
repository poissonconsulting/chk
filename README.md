
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chk <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis build
status](https://travis-ci.com/poissonconsulting/chk.svg?branch=master)](https://travis-ci.com/poissonconsulting/chk)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/chk?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/chk)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/chk/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/chk?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Tinyverse
status](https://tinyverse.netlify.com/badge/chk)](https://CRAN.R-project.org/package=chk)
[![CRAN
status](https://www.r-pkg.org/badges/version/chk)](https://cran.r-project.org/package=chk)
![CRAN downloads](https://cranlogs.r-pkg.org/badges/chk)
<!-- badges: end -->

`chk` is an R package for developers to check user-supplied function
arguments.

It is designed to be simple, customizable and fast.

## Installation

To install the latest release from [CRAN](https://cran.r-project.org)

``` r
install.packages("pkgtemplate")
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/chk)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/chk")
```

To install the latest developmental release from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

``` r
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("chk")
```

## Demonstration

`chk` provides simple commonly used checks as (`chk_` functions) which
can be combined together for more complex checking.

``` r
library(chk)

y <- "a"

chk_string(y)
chk_flag(y)
#> Error: `y` must be a flag (TRUE or FALSE).

chkor(chk_flag(y), chk_number(y))
#> Error: At least one of the following conditions must be met:
#> * `y` must be a flag (TRUE or FALSE).
#> * `y` must be a number (non-missing numeric scalar).

data <- data.frame(x = 1:2)
chk_range(nrow(data), c(3, 8))
#> Error: `nrow(data)` must be between 3 and 8, not 2.
```

Error messages follow the [tidyverse style
guide](https://style.tidyverse.org/error-messages.html) while the errors
themselves are [rlang
errors](https://rlang.r-lib.org/reference/abort.html) of subclass
`chk_error`.

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/chk/articles/chk.html)
vignette.

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
By contributing, you agree to abide by its terms
