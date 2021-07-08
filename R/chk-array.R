#' Check Array
#'
#' @description
#' Checks if is an array using
#'
#' `is.array(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_is
#'
#' @examples
#' # chk_array
#' chk_array(array(1))
#' try(chk_array(matrix(1)))
#' @export
chk_array <- function(x, x_name = NULL) {
  if (vld_array(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be an array", x = x)
}

#' @describeIn chk_array Validate Array
#'
#' @examples
#'
#' # vld_array
#' vld_array(1)
#' vld_array(array(1))
#' @export
vld_array <- function(x) is.array(x)
