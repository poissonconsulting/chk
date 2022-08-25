#' Check Not Missing Argument
#'
#' @description
#' Checks argument not missing using
#'
#' `!missing(x)`
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
#' # chk_not_missing
#' fun <- function (x) { chk_not_missing(x) }
#' fun(1)
#' try(fun())
#' @export
chk_not_missing <- function(x, x_name = "`x`") {
  if (vld_not_missing(x)) {
    return(invisible(x))
  }
  abort_chk(x_name, " must not be missing.", tidy = FALSE)
}

#' @describeIn chk_not_missing Validate Not Missing Argument
#'
#' @examples
#' # vld_not_missing
#' fun <- function (x) { vld_not_missing(x) }
#' fun()
#' fun(1)
#' @export
vld_not_missing <- function(x) {
  !missing(x)
}
