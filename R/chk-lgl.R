#' Check Logical Scalar
#'
#' @description
#' Checks if logical scalar using
#'
#' `is.logical(x) && length(x) == 1L`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_logical
#' @export
#'
#' @examples
#'
#' # chk_lgl
#' chk_lgl(NA)
#' try(chk_lgl(1))
chk_lgl <- function(x, x_name = NULL) {
  if (vld_lgl(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a logical scalar (TRUE, FALSE or NA)", x = x)
}

#' @describeIn chk_lgl Validate Logical Scalar
#'
#' @export
#'
#' @examples
#'
#' # vld_lgl
#' vld_lgl(TRUE)
#' vld_lgl(FALSE)
#' vld_lgl(NA)
#' vld_lgl(1)
#' vld_lgl(c(TRUE, TRUE))
vld_lgl <- function(x) is.logical(x) && length(x) == 1L
