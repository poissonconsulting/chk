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
#' @param sep A string of the separator.
#' @param brac A string to brac the values by.
#'
#' @return A string.
#' @export
#'
#' @examples
#' cc(1:2)
#' cc(1:2, conj = " or")
#' cc(3:1, brac = "'")
#' cc(1:11)
#' cc(as.character(1:2))
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
cc <- function(x, conj = ", ", sep = ", ",
               brac = if(is.character(x) || is.factor(x)) "'" else "") {
  if(!(is.character(conj) && length(conj) == 1)) 
    stop("`conj` must be a character scalar.", call. = FALSE)
  if(!(is.character(sep) && length(sep) == 1)) 
    stop("`sep` must be a character scalar.", call. = FALSE)
  if(!(is.character(brac) && length(brac) %in% 1:2))
    stop("`brac` must be a character vector of length 1 or 2.", call. = FALSE)

  if(!length(x)) return(character(0))
  x <- paste0(brac[1], x, brac[length(brac)])
  n <- length(x)
  if(n == 1L) return(x)
  if(n == 2L) return(paste(x, collapse = conj))
  if(n > 10) {
    x <- c(x[1:8], "...", x[n])
    n <- 10
  }
  paste(c(paste0(x[1:(n-1)], collapse = sep), x[n]), collapse = conj)
}
