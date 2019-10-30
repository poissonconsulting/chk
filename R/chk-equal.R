#' Check Equal
#'
#' @description
#' Checks if is equal (identical within tolerance) to y using
#'
#' `vld_true(all.equal(x, y, tolerance))`
#'
#' @inheritParams chk_flag
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_equal
#' @export
#'
#' @examples
#'
#' # chk_equal
#' chk_equal(1, 1.00000001)
#' try(chk_equal(1, 1.0000001))
#' chk_equal(1, 1L)
#' chk_equal(c(x = 1), c(x = 1L))
#' try(chk_equal(c(x = 1), c(y = 1L)))
chk_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps),
                      x_name = NULL) {
  if(vld_equal(x, y, tolerance = tolerance)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be equal to: ", y)
}


#' @describeIn chk_equal Validate Equal
#'
#' @export
#'
#' @examples
#'
#' vld_equal(1, 1.00000001)
vld_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance))
}
