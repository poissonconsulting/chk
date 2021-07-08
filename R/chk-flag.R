#' Check Flag
#'
#' @description
#' Checks if non-missing logical scalar using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x)`
#'
#' **Pass**: `TRUE`, `FALSE`.
#'
#' **Fail**: `logical(0)`, `c(TRUE, TRUE)`, `"TRUE"`, `1`, `NA`.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_logical
#'
#' @examples
#' # chk_flag
#' chk_flag(TRUE)
#' try(vld_flag(1))
#' @export
chk_flag <- function(x, x_name = NULL) {
  if (vld_flag(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a flag (TRUE or FALSE)", x = x)
}

#' @describeIn chk_flag Validate Flag
#'
#' @examples
#' # vld_flag
#' vld_flag(TRUE)
#' vld_flag(1)
#' @export
vld_flag <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x)
