#' Check Missing Argument
#'
#' @description
#' Checks argument missing using
#'
#' `missing(x)`
#'
#' @details
#' Currently only checks if value is available
#' (as opposed to whether it was specified).
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_misc
#'
#' @examples
#' # chk_missing
#' fun <- function (x) { chk_missing(x) }
#' fun()
#' try(fun(1))
#' @export
chk_missing <- function(x, x_name = NULL) {
  if (vld_missing(x)) {
    return(invisible(NULL))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be missing")
}

#' @describeIn chk_missing Validate Missing Argument
#'
#' @examples
#' # vld_missing
#' fun <- function (x) { vld_missing(x) }
#' fun()
#' fun(1)
#' @export
vld_missing <- function(x) {
  missing(x)
}
