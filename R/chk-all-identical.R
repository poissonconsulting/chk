#' Check All Identical
#'
#' @description
#' Checks all elements in x identical using
#'
#' `length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))`
#'
#'
#' **Good**: `c(1, 1.00000001)`, `list(1, 1)`
#'
#' **Bad**: `c(1, 1.0000001)`, `list(1, NA)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_alls
#' @export
#'
#' @examples
#'
#' # chk_all_identical
#' chk_all_identical(c(1, 1))
#' try(chk_all_identical(c(1, 1.1)))
chk_all_identical <- function(x, x_name = NULL) {
  if (vld_all_identical(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must have identical elements")
}

#' @describeIn chk_all_identical Validate All Identical
#'
#' @export
#'
#' @examples
#'
#' # vld_all_identical
#' vld_all_identical(c(1, 1))
vld_all_identical <- function(x) {
  length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))
}
