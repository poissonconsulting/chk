#' Check Logical
#'
#' @description
#' Checks if logical using
#'
#' `is.logical(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
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
