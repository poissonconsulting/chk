#' Check Matrix
#'
#' @description
#' Checks if is a matrix using
#'
#' `is.matrix(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_structure_checkers
#'
#' @seealso [is.matrix()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_matrix
#' chk_matrix(matrix(1))
#' try(chk_matrix(array(1)))
#' @export
chk_matrix <- function(x, x_name = NULL) {
  if (vld_matrix(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be an matrix", x = x)
}

#' @describeIn chk_matrix Validate Matrix
#'
#' @examples
#' # vld_matrix
#' vld_matrix(1)
#' vld_matrix(matrix(1))
#' @export
vld_matrix <- function(x) is.matrix(x)
