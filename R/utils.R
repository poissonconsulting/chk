#' Abort Check
#'
#' A wrapper on \code{\link{err}} that sets the subclass to be 'chk_error'.
#'
#' It is exported to allow users to easily construct their own `chk_` functions.
#'
#' @inheritParams message_chk
#' @return Throws an error of class `'chk_error'`.
#' @seealso [err()]
#' @export
#'
#' @examples
#' try(abort_chk("x must be NULL"))
#' try(abort_chk("`x` must be NULL"))
#' try(abort_chk("there %r %n problem value%s", n = 1))
#' try(abort_chk("there %r %n problem value%s", n = 1.5))
abort_chk <- function(..., n = NULL, tidy = TRUE) {
  err(..., n = n, tidy = tidy, .subclass = "chk_error")
}

#' Deparse Back Tick
#'
#' `deparse_backtick_chk` is a wrapper on \code{\link{deparse}} 
#' and `backtick_chk`.
#'
#' It is exported to allow users to easily construct their own `chk_` functions.
#'
#' @param x A substituted object to deparse.
#'
#' @return A string of the back ticked substituted object.
#' @seealso \code{\link{deparse}}
#' @export
#'
#' @examples
#' 
#' # deparse_backtick_chk
#' deparse_backtick_chk(2)
#' deparse_backtick_chk(2^2)
deparse_backtick_chk <- function(x) backtick_chk(deparse(x))

#' @describeIn deparse_backtick_chk Back Tick
#' @export
backtick_chk <- function(x) p0("`", x, "`")

#' @describeIn deparse_backtick_chk Unback Tick
#' @export
unbacktick_chk <- function(x) gsub("`", "", x)
