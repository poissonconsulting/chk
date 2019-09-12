edit_string <- function(..., n) {
  string <- p0(..., collapse = "")
  if (!is.null(n)) {
    string <- gsub("%s", if (n == 1) "" else "s", string, fixed = TRUE)
    string <- gsub("%r", if (n == 1) "is" else "are", string, fixed = TRUE)
    string <- gsub("%n", n, string, fixed = TRUE)
  }
  string
}

#' Stop, Warning and Message
#'
#' Wrappers on
#' \code{\link[rlang]{abort}()}, \code{\link[rlang]{warn}()} and
#'  \code{\link[rlang]{inform}()}.
#'
#' @section \code{sprintf}-like types:
#' The following \code{sprintf}-like types can be used in the custom messages:
#'
#' \describe{
#'   \item{\code{n}}{The value of n.}
#'   \item{\code{s}}{'' if n == 1 otherwise 's'}
#'   \item{\code{r}}{'is' if n == 1 otherwise 'are'}
#' }
#'
#' @inheritParams base::stop
#' @inheritParams rlang::abort
#' @param n The value of n for converting \code{sprintf}-like types.
#' @name err
NULL

#' @describeIn err Error
#'
#' @export
#'
#' @examples
#'
#' # err
#' try(err("this is an error"))
err <- function(..., n = NULL, .subclass = NULL) {
  abort(edit_string(..., n = n), .subclass = .subclass)
}

#' @describeIn err Warning
#'
#' @export
#'
#' @examples
#'
#' # wrn
#' wrn("this is a warning")
#' wrn("there %r %n problem value%s")
#' wrn("there %r %n problem value%s", n = 1)
#' wrn("there %r %n problem value%s", n = 2)
wrn <- function(..., n = NULL, .subclass = NULL) {
  warn(edit_string(..., n = n), .subclass = .subclass)
}

#' @describeIn err Message
#'
#' @export
#'
#' @examples
#'
#' # msg
#' msg("this is a message")
#' msg("there %r %n problem value%s")
#' msg("there %r %n problem value%s", n = 1)
#' msg("there %r %n problem value%s", n = 2)
msg <- function(..., n = NULL, .subclass = NULL) {
  inform(edit_string(..., n = n), .subclass = .subclass)
}
