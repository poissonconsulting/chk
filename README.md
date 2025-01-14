
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chk <img src="man/figures/logo.png" align="right" alt="chk logo of completed tick mark" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/chk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/chk/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/chk/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/chk)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit)
[![CRAN
status](https://www.r-pkg.org/badges/version/chk)](https://cran.r-project.org/package=chk)
![CRAN downloads](https://cranlogs.r-pkg.org/badges/chk)
<!-- badges: end -->

`chk` is an R package for developers to check user-supplied function
arguments.

It is designed to be simple, customizable and fast.

## Demonstration

`chk` provides simple commonly used checks as (`chk_` functions) which
can be combined together for more complex checking.

``` r
library(chk)

y <- "a"

chk_string(y)
chk_flag(y)
#> Error:
#> ! `y` must be a flag (TRUE or FALSE).

data <- data.frame(x = 1:2)
chk_range(nrow(data), c(3, 8))
#> Error:
#> ! `nrow(data)` must be between 3 and 8, not 2.
```

Or used inside functions to test user-provided arguments.

``` r
my_fun <- function(x) {
  chk_flag(x)
  x
}
my_fun(TRUE)
#> [1] TRUE
my_fun(NA)
#> Error in `my_fun()`:
#> ! `x` must be a flag (TRUE or FALSE).
```

Error messages follow the [tidyverse style
guide](https://style.tidyverse.org/errors.html) while the errors
themselves are [rlang
errors](https://rlang.r-lib.org/reference/abort.html) of class
`chk_error`.

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/chk/articles/chk.html)
vignette.

## Installation

### Release

To install the release version from
[CRAN](https://CRAN.R-project.org/package=chk).

``` r
install.packages("chk")
```

The website for the release version is at
<https://poissonconsulting.github.io/chk/>.

### Development

To install the development version from
[GitHub](https://github.com/poissonconsulting/chk)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/chk")
```

or from [r-universe](https://poissonconsulting.r-universe.dev/chk).

``` r
install.packages("chk", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
```

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

## Code of Conduct

Please note that the chk project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
