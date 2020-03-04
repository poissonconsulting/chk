#' Check All Equivalent
#'
#' @description
#' Checks all elements in x equivalent using
#'
#' `length(x) < 2L || all(vapply(x, vld_equivalent, TRUE, y = x[[1]], tolerance = tolerance))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_alls
#'
#' @examples
#' # chk_all_equivalent
#' chk_all_equivalent(c(1, 1.00000001))
#' try(chk_all_equivalent(c(1, 1.0000001)))
#' chk_all_equivalent(list(c(x = 1), c(x = 1)))
#' chk_all_equivalent(list(c(x = 1), c(y = 1)))
#' @export
chk_all_equivalent <- function(x, tolerance = sqrt(.Machine$double.eps), x_name = NULL) {
  if (vld_all_equivalent(x, tolerance = tolerance)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must have equivalent elements", x = x, tolerance = tolerance)
}

#' @describeIn chk_all_equivalent Validate All Equivalent
#'
#' @examples
#' # vld_all_equivalent
#' vld_all_equivalent(c(x = 1, y = 1))
#' @export
vld_all_equivalent <- function(x, tolerance = sqrt(.Machine$double.eps)) {
  length(x) < 2L || all(vapply(x, vld_equivalent, TRUE, y = x[[1]], tolerance = tolerance))
}
