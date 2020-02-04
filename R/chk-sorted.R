#' Check Sorted
#'
#' @description
#' Checks if is sorted using
#'
#' `is.unsorted(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_miscellaneous
#' @export
#'
#' @examples
#'
#' # chk_sorted
#' chk_sorted(1:2)
#' try(chk_sorted(2:1))
chk_sorted <- function(x, x_name = NULL) {
  if (vld_sorted(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be sorted", x = x)
}

#' @describeIn chk_sorted Validate Sorted
#'
#' @export
#'
#' @examples
#'
#' # vld_sorted
#' vld_sorted(1:2)
#' vld_sorted(2:1)
vld_sorted <- function(x) !is.unsorted(x)
