edit_string <- function(..., n) {
  string <- p0(..., collapse = "")
  if(!is.null(n)) {
    string <- gsub("%s", if(n == 1) "" else "s", string, fixed = TRUE)
    string <- gsub("%r", if(n == 1) "is" else "are", string, fixed = TRUE)
    string <- gsub("%n", n, string, fixed = TRUE)  
  }
  string
}

#' Stop, Warning and Message
#'
#' Wrappers on 
#' \code{\link[base]{stop}()}, \code{\link[base]{warning}()} and
#'  \code{\link[base]{message}()}.
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
#' @param n The value of n for converting \code{sprintf}-like types.
#' @export
#'
#' @examples
#' try(err("this is an error"))
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
err <- function (..., n = NULL, call. = FALSE) {
  stop(edit_string(..., n = n), call. = call.)
}

#' @describeIn err Warning
#' 
#' @export
#'
#' @examples
#' 
#' # wrn
#' 
#' wrn("this is a warning")
#' wrn("there %r %n problem value%s")
#' wrn("there %r %n problem value%s", n = 1)
#' wrn("there %r %n problem value%s", n = 2)
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
wrn <- function (..., n = NULL, call. = FALSE) {
  warning(edit_string(..., n = n), call. = call.)
}

#' @describeIn err Message
#' 
#' @export
#'
#' @examples
#' 
#' # msg
#' 
#' msg("this is a message")
#' msg("there %r %n problem value%s")
#' msg("there %r %n problem value%s", n = 1)
#' msg("there %r %n problem value%s", n = 2)
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
msg <- function (..., n = NULL) {
  message(edit_string(..., n = n))
}

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
#  Licence: CC0
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
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
p0 <- function (..., collapse = NULL) 
  paste0(..., collapse = collapse)
