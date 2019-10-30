#' Check Equivalent
#'
#' @description
#' checks if is equivalent (equal ignoring attributes) to y using
#'
#' `vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))`
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
#' # chk_equivalent
#' chk_equivalent(1, 1.00000001)
#' try(chk_equivalent(1, 1.0000001))
#' chk_equivalent(1, 1L)
#' chk_equivalent(c(x = 1), c(y = 1))
chk_equivalent <- function(x, y, tolerance = sqrt(.Machine$double.eps),
                           x_name = NULL) {
  if(vld_equivalent(x, y, tolerance = tolerance)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be equivalent to: ", y)
}


#' @describeIn chk_equivalent Validate Equivalent
#'
#' @export
#'
#' @examples
#'
#' vld_equivalent(c(x = 1), c(y = 1L))
vld_equivalent <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))
}
