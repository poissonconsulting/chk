#' Check Identical, Equal or Equivalent
#'
#' @inheritParams chk_true
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso \code{\link{chk_all_identical}()}
#' @name chk_identical
NULL

#' @describeIn chk_identical Check Identical
#'
#' @description
#'
#' `chk_identical()`
#' checks if is identical to y using
#'
#' `identical(x, y)`.
#'
#' @export
#'
#' @examples
#'
#' # chk_identical
#' chk_identical(1, 1)
#' try(chk_identical(1, 1L))
#' chk_identical(c(1, 1), c(1, 1))
#' try(chk_identical(1, c(1, 1)))
chk_identical <- function(x, y, x_name = NULL) {
  if (identical(x, y)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be identical to: ", y)
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_identical(1, 1)
vld_identical <- function(x, y) identical(x, y)

#' @describeIn chk_identical Check Equal
#'
#' @description
#'
#' `chk_equal()`
#' checks if is equal (identical within tolerance) to y using
#'
#' `vld_true(all.equal(x, y, tolerance))`.
#'
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
  if (vld_equal(x, y, tolerance = tolerance)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be equal to: ", y)
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_equal(1, 1.00000001)
vld_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance))
}

#' @describeIn chk_identical Check Equivalent
#'
#' `chk_equivalent()`
#' checks if is equivalent (equal ignoring attributes) to y using
#'
#' \code{\link{vld_true}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}.
#'
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
  if (vld_equivalent(x, y, tolerance = tolerance)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be equivalent to: ", y)
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_equivalent(c(x = 1), c(y = 1L))
vld_equivalent <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance, check.attributes = FALSE))
}
