#' Check Whole Numeric
#'
#' @description
#' Checks if integer vector or double equivalent using
#'
#' `is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))`
#'
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_is
#'
#' @examples
#' # chk_whole_numeric
#' chk_whole_numeric(1)
#' try(chk_whole_numeric(1.1))
#' @export
chk_whole_numeric <- function(x, x_name = NULL) {
  if (vld_whole_numeric(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a whole numeric vector (integer vector or double equivalent)",
    x = x
  )
}

#' @describeIn chk_whole_numeric Validate Whole Numeric
#'
#' @examples
#' # vld_whole_numeric
#' vld_whole_numeric(1)
#' vld_whole_numeric(NA_real_)
#' vld_whole_numeric(1:2)
#' vld_whole_numeric(double(0))
#' vld_whole_numeric(TRUE)
#' vld_whole_numeric(1.5)
#' @export
vld_whole_numeric <- function(x) {
  is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))
}
