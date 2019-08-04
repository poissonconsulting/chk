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

#' Concatenate with Commas
#' 
#' Concatenates object values into a string with each value separated by a comma
#' and the last value separated by a conjunction. 
#' 
#' If x has more than 10 values an ellipsis is used to ensure only 10 values 
#' are displayed (including the ellipsis)
#'
#' @param x The object to concatenate.
#' @param conj A string of the conjunction to separate the last value by.
#' @param brac A string to brac the values by.
#'
#' @return A string.
#' @export
#'
#' @examples
#' cc(1:2)
#' cc(1:2, conj = ",")
#' cc(3:1, brac = "'")
#' cc(1:11)
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
cc <- function(x, conj = " or ", brac = "") {
  chk_string(conj)
  chk_string(brac)
  
  if(!length(x)) return(character(0))
  x <- p0(brac, x, brac)
  n <- length(x)
  if(n == 1L) return(x)
  if(n == 2L) return(p(x, collapse = conj))
  if(n > 10) {
    x <- c(x[1:8], "...", x[n])
    n <- 10
  }
  p(c(p0(x[1:(n-1)], collapse = ", "), x[n]), collapse = conj)
}
