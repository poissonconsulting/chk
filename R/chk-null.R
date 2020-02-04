#' Check NULL
#'
#' @description
#' Checks if NULL using
#'
#' `is.null(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_nulls
#' @export
#'
#' @examples
#'
#' # chk_null
#' try(chk_null(1))
#' chk_null(NULL)
chk_null <- function(x, x_name = NULL) {
  if (vld_null(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be NULL", x = x)
}

#' @describeIn chk_null Validate NULL
#'
#' @export
#'
#' @examples
#'
#' # vld_null
#' vld_null(NULL)
#' vld_null(1)
vld_null <- function(x) is.null(x)
