#' Check Equal, Identical or Equivalent
#' 
#' Checks if two objects are equal, identical or equivalent.
#'
#' @details  
#' 
#' \code{chk_equal()}: Check Equal
#' 
#' Checks if is equal (identical within tolerance) to y using:
#'
#' \code{isTRUE(\link{all.equal}(x, y, tolerance))}
#'  
#' @inheritParams chk_true
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_equal
#' try(chk_equal(1, 1.0000001))
#' chk_equal(1, 1.00000001)
#' chk_equal(1, 1L)
#' try(chk_equal(c(x = 1), c(y = 1L)))
#' chk_equal(c(x = 1), c(x = 1L))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE,
                       x_name = NULL) {
  if(isTRUE(all.equal(x, y, tolerance))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be equal to: ", y, ".")
}

#' @describeIn chk_equal Check Identical
#'
#' Checks if is identical to y using:
#' 
#' \code{\link{identical}(x, y)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_identical
#' try(chk_identical(1, 1L))
#' chk_identical(1, 1)
#' try(chk_identical(1, c(1,1)))
#' chk_identical(c(1,1), c(1,1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_identical <- function (x, y, err = TRUE, x_name = NULL) {
  if(identical(x, y)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be identical to: ", y, ".")
}

#' @describeIn chk_equal Check Equivalent
#' 
#' Checks if is equivalent (equal ignoring attributes) to y using:
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_equivalent
#' try(chk_equivalent(1, 1.0000001))
#' chk_equivalent(1, 1.00000001)
#' chk_equivalent(1, 1L)
#' chk_equivalent(c(x = 1), c(y = 1L))
#' chk_equivalent(c(x = 1), c(x = 1L))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps), 
                            err = TRUE, x_name = NULL) {
  if(isTRUE(all.equal(x, y, tolerance, check.attributes = FALSE))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be equivalent to: ", y, ".")
}
