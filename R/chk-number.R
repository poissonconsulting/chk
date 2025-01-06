#' Check Number
#'
#' @description
#' Checks if non-missing numeric scalar using
#'
#' `is.numeric(x) && length(x) == 1L && !anyNA(x)`
#'
#' **Pass**: `1`, `2L`, `log(10)`, `-Inf`
#'
#' **Fail**: `"a"`, `1:3`, `NA_real_`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_type_checkers scalar_checkers
#'
#' @seealso [is.numeric()]
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_number
#' chk_number(1.1)
#' try(chk_number(TRUE))
#' @export
chk_number <- function(x, x_name = NULL) {
  if (vld_number(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a number (non-missing numeric scalar)", x = x)
}

#' @describeIn chk_number Validate Number
#'
#' @examples
#' # vld_number
#' vld_number(1.1)
#' @export
vld_number <- function(x) {
  is.numeric(x) && length(x) == 1L && !anyNA(x)
}
