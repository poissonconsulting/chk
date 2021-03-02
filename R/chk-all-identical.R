#' Check All Identical
#'
#' @description
#' Checks all elements in x identical using
#'
#' `length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))`
#'
#'
#' **Pass**: `c(1, 1, 1)`, `list(1, 1)`
#'
#' **Fail**: `c(1, 1.0000001)`, `list(1, NA)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_alls
#'
#' @examples
#' # chk_all_identical
#' chk_all_identical(c(1, 1))
#' try(chk_all_identical(c(1, 1.1)))
#' @export
chk_all_identical <- function(x, x_name = NULL) {
  if (vld_all_identical(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_all_identical(x, x_name)
}

#' @describeIn chk_all_identical Check All Identical
#'
#' @examples
#' # check_all_identical
#' check_all_identical(c(1, 1))
#' try(check_all_identical(c(1, 1.1)))
#' @export
check_all_identical <- function(x, x_name = NULL) {
  if (vld_all_identical(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_all_identical(x, x_name)
}

#' @describeIn chk_all_identical Validate All Identical
#'
#' @examples
#' # vld_all_identical
#' vld_all_identical(c(1, 1))
#' @export
vld_all_identical <- function(x) {
  length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))
}

abort_all_identical <- function(x, x_name) {
  abort_chk(x_name, " must have identical elements", x = x)
}
