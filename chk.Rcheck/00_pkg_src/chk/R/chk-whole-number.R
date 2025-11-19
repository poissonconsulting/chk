#' Check Whole Number
#'
#' @description
#'  Checks if non-missing integer scalar or double equivalent using
#'
#' `vld_number(x) && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`
#'
#' **Pass**: `1`, `2L`, `1e10`, `-Inf`
#'
#' **Fail**: `"a"`, `1:3`, `NA_integer_`, `log(10)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family scalar_checker
#' @family whole_number_checkers
#'
#' @seealso [is.integer()]
#' @seealso [vld_true()]
#' @seealso [vld_number()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_whole_number
#' chk_whole_number(2)
#' try(chk_whole_number(1.1))
#' @export
chk_whole_number <- function(x, x_name = NULL) {
  if (vld_whole_number(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a whole number (non-missing integer scalar or double equivalent)",
    x = x
  )
}

#' @describeIn chk_whole_number Validate Whole Number
#'
#' @examples
#' # vld_whole_number
#' vld_whole_number(2)
#' @export
vld_whole_number <- function(x) {
  vld_number(x) &&
    (is.integer(x) || vld_true(all.equal(x, trunc(x))))
}
