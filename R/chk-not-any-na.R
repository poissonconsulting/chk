#' Check Not Any Missing Values
#'
#' @description
#' Checks if not any missing values using
#'
#' `!anyNA(x)`
#'
#' **Good**: `1`, `1:2`, `"1"`, `logical(0)`.
#'
#' **Bad**: `NA`, `c(1, NA)`.
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_miscellaneous
#' @export
#'
#' @examples
#'
#' # chk_not_any_na
#' chk_not_any_na(1)
#' try(chk_not_any_na(NA))
chk_not_any_na <- function(x, x_name = NULL) {
  if (vld_not_any_na(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must not have any missing values")
}


#' @describeIn chk_not_any_na Validate Not Any Missing Values
#'
#' @export
#'
#' @examples
#'
#' # vld_not_any_na
#' vld_not_any_na(1)
#' vld_not_any_na(1:2)
#' vld_not_any_na(NA_real_)
#' vld_not_any_na(integer(0))
#' vld_not_any_na(c(NA, 1))
#' vld_not_any_na(TRUE)
vld_not_any_na <- function(x) !anyNA(x)
