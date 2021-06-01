#' Check NULL
#'
#' @description
#' Checks if NULL using
#'
#' `is.null(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_nulls
#'
#' @examples
#' # chk_null
#' try(chk_null(1))
#' chk_null(NULL)
#' @export
chk_null <- function(x, x_name = NULL) {
  if (vld_null(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be NULL", x = x)
}

#' @describeIn chk_null Validate NULL
#'
#' @examples
#' # vld_null
#' vld_null(NULL)
#' vld_null(1)
#' @export
vld_null <- function(x) is.null(x)
