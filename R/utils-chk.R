#' Stop
#'
#' A wrapper on \code{\link[base]{stop}(..., call. = FALSE)}.
#' 
#' @inheritParams base::stop
#' @seealso \code{\link{wrn}()} and \code{\link{msg}()}
#' @export
#'
#' @examples
#' try(err("this is an error"))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
err <- function (...) stop(..., call. = FALSE)

#' Message
#'
#' A wrapper on \code{\link[base]{message}(...)}.
#' 
#' @inheritParams base::message
#' @seealso \code{\link{err}()} and \code{\link{wrn}()}
#' @export
#'
#' @examples
#' msg("this is a message")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
msg <- function (...) message(...)

#' Warning
#'
#' A wrapper on \code{\link[base]{warning}(..., call. = FALSE)}.
#' 
#' @inheritParams base::warning
#' @seealso \code{\link{err}()} and \code{\link{msg}()}
#' @export
#'
#' @examples
#' wrn("this is a warning")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
wrn <- function (...) warning(..., call. = FALSE)

#' Concatenate Strings
#'
#' A wrapper on \code{\link[base]{paste}()}.
#' 
#' @inheritParams base::paste
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' p("a", "b")
#' p(c("a", "b"), collapse = " ")
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
p <- function (..., sep = " ", collapse = NULL) 
  paste(..., sep = sep, collapse = collapse)

#' @describeIn p A wrapper on \code{\link[base]{paste0}()}
#' @export
#' 
#' @examples 
#' p0("a", "b")
#' p0(c("a", "b"), collapse = "")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
p0 <- function (..., collapse = NULL) 
  paste0(..., collapse = collapse)
