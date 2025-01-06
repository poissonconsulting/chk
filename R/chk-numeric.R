#' Check Numeric
#'
#' @description
#' Checks if numeric using
#'
#' `is.numeric(x)`
#'
#' **Pass**: `1`, `1:2`, `NA_real_`, `integer(0)`, `matrix(1:3)`.
#'
#' **Fail**: `TRUE`, `"1"`, `NA`, `NULL`.
#'
#' @inheritParams chk_flag
#' @inherit params return
#'
#' @family data_type_checkers
#'
#' @seealso [is.numeric()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_numeric
#' chk_numeric(1)
#' try(chk_numeric("1"))
#' @export
chk_numeric <- function(x, x_name = NULL) {
  if (vld_numeric(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be numeric", x = x)
}

#' @describeIn chk_numeric Validate Numeric
#'
#' @examples
#' # vld_numeric
#' vld_numeric(1)
#' vld_numeric(1:2)
#' vld_numeric(NA_real_)
#' vld_numeric(integer(0))
#' vld_numeric("1")
#' vld_numeric(TRUE)
#' @export
vld_numeric <- function(x) is.numeric(x)
