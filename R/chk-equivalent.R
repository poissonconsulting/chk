#' Check Equivalent
#'
#' @description
#' Checks if is equivalent (equal ignoring attributes) to y using
#'
#' `vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_equals
#'
#' @examples
#' # chk_equivalent
#' chk_equivalent(1, 1.00000001)
#' try(chk_equivalent(1, 1.0000001))
#' chk_equivalent(1, 1L)
#' chk_equivalent(c(x = 1), c(y = 1))
#' @export
chk_equivalent <- function(x, y, tolerance = sqrt(.Machine$double.eps),
                           x_name = NULL) {
  if (vld_equivalent(x, y, tolerance = tolerance)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y_name <- as_label(y)
  abort_chk(x_name, " must be equivalent to: ", y_name, x = x, y = y)
}

#' @describeIn chk_equivalent Validate Equivalent
#'
#' @examples
#' vld_equivalent(c(x = 1), c(y = 1L))
#' @export
vld_equivalent <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))
}
