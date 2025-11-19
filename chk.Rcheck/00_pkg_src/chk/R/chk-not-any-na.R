#' Check Not Any Missing Values
#'
#' @description
#' Checks if not any missing values using
#'
#' `!anyNA(x)`
#'
#' **Pass**: `1`, `1:2`, `"1"`, `logical(0)`.
#'
#' **Fail**: `NA`, `c(1, NA)`.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family misc_checkers
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_not_any_na
#' chk_not_any_na(1)
#' try(chk_not_any_na(NA))
#' @export
chk_not_any_na <- function(x, x_name = NULL) {
  if (vld_not_any_na(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must not have any missing values", x = x)
}

#' @describeIn chk_not_any_na Validate Not Any Missing Values
#'
#' @examples
#' # vld_not_any_na
#' vld_not_any_na(1)
#' vld_not_any_na(1:2)
#' vld_not_any_na(NA_real_)
#' vld_not_any_na(integer(0))
#' vld_not_any_na(c(NA, 1))
#' vld_not_any_na(TRUE)
#' @export
vld_not_any_na <- function(x) !anyNA(x)
