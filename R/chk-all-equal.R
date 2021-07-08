#' Check All Equal
#'
#' @description
#' Checks all elements in x equal using
#'
#'  `length(x) < 2L || all(vapply(x, vld_equal, TRUE, y = x[[1]], tolerance = tolerance))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_alls
#'
#' @examples
#' # chk_all_equal
#' chk_all_equal(c(1, 1.00000001))
#' try(chk_all_equal(c(1, 1.0000001)))
#' chk_all_equal(list(c(x = 1), c(x = 1)))
#' try(chk_all_equal(list(c(x = 1), c(y = 1))))
#' @export
chk_all_equal <- function(x, tolerance = sqrt(.Machine$double.eps), x_name = NULL) {
  if (vld_all_equal(x, tolerance = tolerance)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must have equal elements", x = x, tolerance = tolerance)
}

#' @describeIn chk_all_equal Validate All Equal
#'
#' @examples
#' # vld_all_equal
#' vld_all_equal(c(1, 1L))
#' @export
vld_all_equal <- function(x, tolerance = sqrt(.Machine$double.eps)) {
  length(x) < 2L || all(vapply(x, vld_equal, TRUE, y = x[[1]], tolerance = tolerance))
}
