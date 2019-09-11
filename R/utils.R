#' Abort Check
#' 
#' A wrapper on \code{\link[rlang]{abort}(paste0(...))} that throws an error.
#' 
#' It is exported to allow users to construct their own `chk_` functions.
#'
#' @param ... A substituted object to deparse.
#' @return Throws an error.
#' @seealso \code{\link[rlang]{abort}}
#' @export
#'
#' @examples
#' try(abort_chk())
#' try(abort_chk("x must be NULL."))
abort_chk <- function(...) abort(p0(...))

#' Deparse Tick
#' 
#' \code{deparse_backtick} is a wrapper on \code{\link{deparse}} that
#' also back ticks the return string.
#' 
#' It is exported to allow users to construct their own `chk_` functions.
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
