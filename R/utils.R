#' Abort Check
#'
#' A wrapper on \code{\link{err}} that sets the subclass to be 'chk_error'.
#'
#' It is exported to allow users to easily construct their own `chk_` functions.
#'
#' @inheritParams message_chk
#' @return Throws an error of class \code{'chk_error'}.
#' @seealso \code{{err}}
#' @export
#'
#' @examples
#' try(abort_chk())
#' try(abort_chk("x must be NULL."))
abort_chk <- function(..., n = NULL) err(..., n = n, .subclass = "chk_error")

#' Deparse Tick
#'
#' \code{deparse_backtick} is a wrapper on \code{\link{deparse}} that
#' also back ticks the return string.
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
#' deparse_backtick(2)
#' deparse_backtick(2^2)
deparse_backtick <- function(x) backtick(deparse(x))
