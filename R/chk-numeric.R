#' Check Numeric
#'
#' @description
#' Checks if numeric using
#'
#' `is.numeric(x)`
#'
#' **Good**: `1`, `1:2`, `NA_real_`, `integer(0)`, `matrix(1:3)`.
#'
#' **Bad**: `TRUE`, `"1"`, `NA`, `NULL`.
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_numeric
#' chk_numeric(1)
#' try(chk_numeric("1"))
chk_numeric <- function(x, x_name = NULL) {
  if (vld_numeric(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be numeric", x = x)
}


#' @describeIn chk_numeric Validate Numeric
#'
#' @export
#'
#' @examples
#'
#' # vld_numeric
#' vld_numeric(1)
#' vld_numeric(1:2)
#' vld_numeric(NA_real_)
#' vld_numeric(integer(0))
#' vld_numeric("1")
#' vld_numeric(TRUE)
vld_numeric <- function(x) is.numeric(x)
