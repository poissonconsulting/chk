#' Check not NULL
#'
#' @description
#' Checks if not NULL using
#'
#' `!is.null(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_nulls
#' @export
#'
#' @examples
#'
#' # chk_not_null
#' try(chk_not_null(NULL))
#' chk_not_null(1)
chk_not_null <- function(x, x_name = NULL) {
  if (vld_not_null(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must not be NULL", x = x)
}

#' @describeIn chk_not_null Validate Not NULL
#'
#' @export
#'
#' @examples
#'
#' # vld_not_null
#' vld_not_null(1)
#' vld_not_null(NULL)
vld_not_null <- function(x) !is.null(x)
