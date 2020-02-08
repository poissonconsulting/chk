#'  Check Vector
#'
#' @description
#' Checks if is a vector using
#'
#' `(is.atomic(x) && !is.matrix(x) && !is.array(x)) || is.list(x)`
#'
#' @details
#' `is.vector(x)` is not reliable because it returns TRUE only
#' if the object is a vector with no attributes apart from names.
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
#' # chk_vector
#' chk_vector(1)
#' chk_vector(list())
#' try(chk_vector(matrix(1)))
chk_vector <- function(x, x_name = NULL) {
  if (vld_vector(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a vector", x = x)
}

#' @describeIn chk_vector Validate Vector
#'
#' @export
#'
#' @examples
#'
#' # vld_vector
#' vld_vector(1)
vld_vector <- function(x) (is.atomic(x) && !is.matrix(x) && !is.array(x)) || is.list(x)
