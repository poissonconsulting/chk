#' Check Whole Numeric Scalar
#'
#' @description
#' Checks if whole numeric scalar using
#'
#' `is.numeric(x) && length(x) == 1L && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @inheritParams params
#' @inherit params return
#'
#'
#' @family deprecated
#'
#' @examples
#' # chk_wnum
#' chk_wnum(1)
#' try(chk_wnum(1.1))
#' @export
chk_wnum <- function(x, x_name = NULL) {
  if (vld_wnum(x)) {
    return(invisible(x))
  }
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_wnum()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_whole_numeric(x)` instead",
    id = "chk_wnum"
  )
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a whole numeric scalar", x = x)
}

#' @describeIn chk_wnum Validate Whole Numeric Scalar
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @examples
#' # vld_wnum
#' vld_wnum(1)
#' vld_wnum(double(0))
#' vld_wnum(NA_real_)
#' vld_wnum(c(1, 1))
#' vld_wnum(1L)
#' @export
vld_wnum <- function(x) {
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_wnum()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_whole_numeric(x)` instead",
    id = "chk_wnum"
  )

  is.numeric(x) && length(x) == 1L && (is.integer(x) || vld_true(all.equal(x, trunc(x))))
}
