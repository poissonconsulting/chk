
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chk <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/chk/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/chk/actions)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/chk/branch/master/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/chk?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
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
install.packages("chk")
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/chk)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/chk")
```

## Demonstration

`chk` provides simple commonly used checks as (`chk_` functions) which
can be combined together for more complex checking.

``` r
library(chk)

y <- "a"

chk_string(y)
chk_flag(y)
#> Error in `err()` at chk/R/utils.R:18:2:
#> ! `y` must be a flag (TRUE or FALSE).

data <- data.frame(x = 1:2)
chk_range(nrow(data), c(3, 8))
#> Error in `err()` at chk/R/utils.R:18:2:
#> ! `nrow(data)` must be between 3 and 8, not 2.
```

Error messages follow the [tidyverse style
guide](https://style.tidyverse.org/error-messages.html) while the errors
themselves are [rlang
errors](https://rlang.r-lib.org/reference/abort.html) of class
`chk_error`.

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/chk/articles/chk.html)
vignette.

## Inspiration

-   [datacheckr](https://github.com/poissonconsulting/datacheckr/)
-   [checkr](https://github.com/poissonconsulting/checkr/)
-   [err](https://github.com/poissonconsulting/err/)
-   [testthat](https://github.com/r-lib/testthat/)

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/chk/issues).

[Pull requests](https://github.com/poissonconsulting/chk/pulls) are
always welcome.

## Code of Conduct

Please note that the chk project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms
