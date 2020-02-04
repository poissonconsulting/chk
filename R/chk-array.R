#' Check Array
#'
#' @description
#' Checks if is a array using
#'
#' `is.array(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_array
#' chk_array(array(1))
#' try(chk_array(matrix(1)))
chk_array <- function(x, x_name = NULL) {
  if (vld_array(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be an array", x = x)
}

#' @describeIn chk_array Validate Array
#'
#' @export
#'
#' @examples
#'
#' # vld_array
#' vld_array(1)
#' vld_array(array(1))
vld_array <- function(x) is.array(x)
