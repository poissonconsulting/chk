#' Check Sorted
#'
#' @description
#' Checks if is sorted using
#'
#' `is.unsorted(x, na.rm = TRUE)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family sorted_checkers
#'
#' @seealso [is.unsorted()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_sorted
#' chk_sorted(1:2)
#' try(chk_sorted(2:1))
#' @export
chk_sorted <- function(x, x_name = NULL) {
  if (vld_sorted(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be sorted", x = x)
}

#' @describeIn chk_sorted Validate Sorted
#'
#' @examples
#' # vld_sorted
#' vld_sorted(1:2)
#' vld_sorted(2:1)
#' @export
vld_sorted <- function(x) !is.unsorted(x, na.rm = TRUE)
