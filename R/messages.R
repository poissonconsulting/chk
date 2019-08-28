#' Stop
#'
#' A wrapper on \code{\link[base]{stop}(..., call. = FALSE)}.
#' 
#' @inheritParams base::stop
#' @export
#'
#' @examples
#' try(err("this is an error"))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
err <- function (...) stop(..., call. = FALSE)

#' Warning
#'
#' A wrapper on \code{\link[base]{warning}(..., call. = FALSE)}.
#' 
#' @inheritParams base::warning
#' @export
#'
#' @examples
#' wrn("this is a warning")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
wrn <- function (...) warning(..., call. = FALSE)

#' Message
#'
#' A wrapper on \code{\link[base]{message}(...)}.
#' 
#' @inheritParams base::message
#' @export
#'
#' @examples
#' msg("this is a message")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
msg <- function (...) message(...)
