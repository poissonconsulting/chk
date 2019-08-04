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
#' p0("a", "b")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
p <- function (..., sep = " ", collapse = NULL) 
  paste(..., sep = sep, collapse = collapse)

#' @describeIn p A wrapper on \code{\link[base]{paste0}()}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
p0 <- function (..., collapse = NULL) 
  paste0(..., collapse = collapse)
