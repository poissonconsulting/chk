#' Check/Validate Equal, Identical or Equivalent
#' 
#' Checks/validates if two objects are equal, identical or equivalent.
#'
#' @inheritParams chk_true
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_equal
NULL

#' @describeIn chk_equal Check Equal
#' 
#' Checks if is equal (identical within tolerance) to y using \code{vld_equal()}.
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
chk_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps),
                       x_name = NULL) {
  if(vld_equal(x, y, tolerance = tolerance)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  y <- utils::capture.output(dput(y, control = "all"))
  .abort(x_name, " must be equal to: ", y, ".")
}

#' @describeIn chk_equal Validate Equal
#' 
#' Validates is equal (identical within tolerance) to y using
#'
#' \code{isTRUE(\link{all.equal}(x, y, tolerance))}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_equal
#' vld_equal(1, 1.00000001)
#' vld_equal(1, 1.0000001)
#' vld_equal(1, 1L)
#' vld_equal(c(x = 1), c(x = 1L))
#' vld_equal(c(x = 1), c(y = 1L))
vld_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps)) {
  isTRUE(all.equal(x, y, tolerance))
}

#' @describeIn chk_equal Check Identical
#'
#' Checks if is identical to y using \code{vld_identical()}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_identical
#' chk_identical(1, 1)
#' try(chk_identical(1, 1L))
#' chk_identical(c(1,1), c(1,1))
#' try(chk_identical(1, c(1,1)))
chk_identical <- function (x, y, x_name = NULL) {
  if(identical(x, y)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  y <- utils::capture.output(dput(y, control = "all"))
  .abort(x_name, " must be identical to: ", y, ".")
}

#' @describeIn chk_equal Validate Identical
#'
#' Validates is identical to y using
#' 
#' \code{\link{identical}(x, y)}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_identical
#' vld_identical(1, 1L)
#' vld_identical(1, 1)
#' vld_identical(1, c(1,1))
#' vld_identical(c(1,1), c(1,1))
vld_identical <- function (x, y) identical(x, y)

#' @describeIn chk_equal Check Equivalent
#' 
#' Checks if is equivalent (equal ignoring attributes) to y using 
#' \code{vld_equivalent()}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_equivalent
#' chk_equivalent(1, 1.00000001)
#' try(chk_equivalent(1, 1.0000001))
chk_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps), 
                            x_name = NULL) {
  if(vld_equivalent(x, y, tolerance = tolerance)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  y <- utils::capture.output(dput(y, control = "all"))
  .abort(x_name, " must be equivalent to: ", y, ".")
}

#' @describeIn chk_equal Validate Equivalent
#' 
#' Validates is equivalent (equal ignoring attributes) to y using
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_equivalent
#' vld_equivalent(1, 1.00000001)
#' vld_equivalent(1, 1L)
#' vld_equivalent(c(x = 1), c(y = 1L))
#' vld_equivalent(c(x = 1), c(x = 1L))
#' vld_equivalent(1, 1.0000001)
vld_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps)) {
  isTRUE(all.equal(x, y, tolerance, check.attributes = FALSE))
}
