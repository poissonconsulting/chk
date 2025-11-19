#' Check Logical
#'
#' @description
#' Checks if logical using
#'
#' `is.logical(x)`
#'
#' If you want to check if it is a scalar,
#' meaning that in addition to being of logical type,
#' it has `length(x) == 1`, you should use [chk_lgl()]
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family logical_checkers
#' @family data_type_checkers
#'
#' @seealso [is.logical()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_logical
#' chk_logical(TRUE)
#' try(chk_logical(1))
#' @export
chk_logical <- function(x, x_name = NULL) {
  if (vld_logical(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be logical", x = x)
}

#' @describeIn chk_logical Validate Logical
#'
#' @examples
#' # vld_logical
#' vld_logical(TRUE)
#' vld_logical(matrix(TRUE))
#' vld_logical(logical(0))
#' vld_logical(NA)
#' vld_logical(1)
#' vld_logical("TRUE")
#' @export
vld_logical <- function(x) is.logical(x)
