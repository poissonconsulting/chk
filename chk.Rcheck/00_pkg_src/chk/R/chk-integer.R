#' Check Integer
#'
#' @description
#' Checks if integer using
#'
#' `is.integer(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_type_checkers
#'
#' @seealso [is.integer()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_integer
#' chk_integer(1L)
#' try(chk_integer(1))
#' @export
chk_integer <- function(x, x_name = NULL) {
  if (vld_integer(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be integer", x = x)
}

#' @describeIn chk_integer Validate Integer
#'
#' @examples
#' # vld_integer
#' vld_integer(1L)
#' vld_integer(matrix(1:4, nrow = 2L))
#' vld_integer(integer(0))
#' vld_integer(NA_integer_)
#' vld_integer(1)
#' vld_integer(TRUE)
#' @export
vld_integer <- function(x) is.integer(x)
