#' Check Whole Numeric Scalar
#'
#' @description
#' Checks if whole numeric scalar using
#'
#' `is.numeric(x) && length(x) == 1L && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_wnum
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
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a whole numeric scalar", x = x)
}

#' @describeIn chk_wnum Validate Whole Numeric Scalar
#'
#' @examples
#' # vld_wnum
#' vld_wnum(1)
#' vld_wnum(double(0))
#' vld_wnum(NA_real_)
#' vld_wnum(c(1,1))
#' vld_wnum(1L)
#' @export
vld_wnum <- function(x) {
  is.numeric(x) && length(x) == 1L && (is.integer(x) || vld_true(all.equal(x, trunc(x))))
}

