#' Check Flag
#'
#' @description
#' Checks if non-missing logical scalar using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x)`
#'
#' **Good**: `TRUE`, `FALSE`, `NA`.
#'
#' **Bad**: `logical(0)`, `c(TRUE, TRUE)`, `"TRUE"`, `1`, `NA_real_`.
#'
#' @param x The object to check.
#' @param x_name A string of the name of object x or NULL.
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_logical
#' @export
#'
#' @examples
#'
#' # chk_flag
#' chk_flag(TRUE)
#' try(vld_flag(1))
chk_flag <- function(x, x_name = NULL) {
  if(vld_flag(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a flag (TRUE or FALSE)")
}

#' @describeIn chk_flag Validate Flag
#'
#' @export
#'
#' @examples
#'
#' # vld_flag
#' vld_flag(TRUE)
#' vld_flag(1)
vld_flag <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x)
