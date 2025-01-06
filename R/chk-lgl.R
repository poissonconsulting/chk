#' Check Logical Scalar
#'
#' @description
#' Checks if logical scalar using
#'
#' `is.logical(x) && length(x) == 1L`
#'
#' If you only want to check the data type (not whether `length(x) == 1`),
#' you should use the [chk_logical()] function.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family logical_checkers
#' @family scalar_checkers
#'
#' @seealso [is.logical()]
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_lgl
#' chk_lgl(NA)
#' try(chk_lgl(1))
#' @export
chk_lgl <- function(x, x_name = NULL) {
  if (vld_lgl(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a logical scalar (TRUE, FALSE or NA)", x = x)
}

#' @describeIn chk_lgl Validate Logical Scalar
#'
#' @examples
#' # vld_lgl
#' vld_lgl(TRUE)
#' vld_lgl(FALSE)
#' vld_lgl(NA)
#' vld_lgl(1)
#' vld_lgl(c(TRUE, TRUE))
#' @export
vld_lgl <- function(x) {
  deprecate_soft(
    "0.9.3",
    what = "chk::chk_lgl()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_logical(x)` instead",
    id = "chk_lgl"
  )
  is.logical(x) && length(x) == 1L
}
