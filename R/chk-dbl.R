#' Check Double Scalar
#'
#' @description
#' Checks if double scalar using
#'
#' `is.double(x) && length(x) == 1L`
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family deprecated
#'
#' @examples
#' # chk_dbl
#' chk_dbl(1)
#' try(chk_dbl(1L))
#' @export
chk_dbl <- function(x, x_name = NULL) {
  if (vld_dbl(x)) {
    return(invisible(x))
  }
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_dbl()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_double(x)` instead",
    id = "chk_dbl"
  )

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be double (real) scalar", x = x)
}

#' @describeIn chk_dbl Validate Double
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @examples
#' # vld_dbl
#' vld_dbl(1)
#' vld_dbl(double(0))
#' vld_dbl(NA_real_)
#' vld_dbl(c(1, 1))
#' vld_dbl(1L)
#' @export
vld_dbl <- function(x) {
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_dbl()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_double(x)` instead",
    id = "chk_dbl"
  )

  is.double(x) && length(x) == 1L
}
