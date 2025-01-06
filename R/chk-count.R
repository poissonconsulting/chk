#' Check Count
#'
#' @description
#' Checks if non-negative whole number using
#'
#' `vld_whole_number(x) && x >= 0`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family scalar_checkers
#' @family whole_number_checkers
#'
#' @seealso [vld_whole_number()]
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_count
#' chk_count(1)
#' try(chk_count(1.5))
#' @export
chk_count <- function(x, x_name = NULL) {
  if (vld_count(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a count (non-negative non-missing integer scalar or double equivalent)", x = x)
}

#' @describeIn chk_count Validate Count
#'
#' @examples
#' # vld_count
#' vld_count(1)
#' vld_count(0L)
#' vld_count(-1)
#' vld_count(0.5)
#' @export
vld_count <- function(x) {
  vld_whole_number(x) && x >= 0
}
