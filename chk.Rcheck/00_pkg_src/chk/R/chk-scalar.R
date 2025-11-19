#' Check Scalar
#'
#' @description
#' Checks if is a vector using
#'
#' `length(x) == 1L`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family scalar_checkers
#'
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_scalar
#' chk_scalar(1)
#' chk_scalar(list(1))
#' try(chk_scalar(1:2))
#' @export
chk_scalar <- function(x, x_name = NULL) {
  if (vld_scalar(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a scalar (length 1)", x = x)
}

#' @describeIn chk_scalar Validate Scalar
#'
#' @examples
#' # vld_scalar
#' vld_scalar(1)
#' @export
vld_scalar <- function(x) length(x) == 1L
