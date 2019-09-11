#' Deparse Tick
#' 
#' \code{deparse_tick} is a wrapper on \code{\link{deparse}} that
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
#' deparse_tick(2)
#' deparse_tick(2^2)
deparse_tick <- function(x) tick(deparse(x))
