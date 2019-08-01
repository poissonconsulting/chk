#' Stop
#'
#' A wrapper on \code{\link[base]{stop}(..., call. = FALSE, domain = NA)}.
#' 
#' @inheritParams base::stop
#' @aliases error
#' @export
#'
#' @examples
#' \dontrun{
#' err("this is an error")
#' }
err <- function (...) stop(..., call. = FALSE, domain = NA)

#' Warning
#'
#' A wrapper on \code{\link[base]{warning}(..., call. = FALSE, domain = NA)}.
#' 
#' @inheritParams base::warning
#' @export
#'
#' @examples
#' \dontrun{
#' wrn("this is a warning")
#' }
wrn <- function (...) warning(..., call. = FALSE, domain = NA)

#' Message
#'
#' A wrapper on \code{\link[base]{message}(..., domain = NA)}.
#' 
#' @inheritParams base::message
#' @export
#'
#' @examples
#' \dontrun{
#' msg("this is a message")
#' }
msg <- function (...) message(..., domain = NA)
