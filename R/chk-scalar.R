#' Check Scalar
#'
#' @description
#' Checks if is a vector using
#'
#' `length(x) == 1L`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_scalars
#' @export
#'
#' @examples
#'
#' # chk_scalar
#' chk_scalar(1)
#' chk_scalar(list(1))
#' try(chk_scalar(1:2))
chk_scalar <- function(x, x_name = NULL) {
  if (vld_scalar(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a scalar (length 1)")
}

#' @describeIn chk_scalar Validate Scalar
#'
#' @export
#'
#' @examples
#'
#' # vld_scalar
#' vld_scalar(1)
vld_scalar <- function(x) length(x) == 1L
