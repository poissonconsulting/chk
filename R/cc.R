#' Concatenate with Commas
#'
#' Concatenates object values into a string with each value separated by a comma
#' and the last value separated by a conjunction.
#'
#' By default, if x has more than 10 values an ellipsis is used
#' to ensure only 10 values are displayed (including the ellipsis).
#'
#' @param x The object to concatenate.
#' @param conj A string of the conjunction to separate the last value by.
#' @param sep A string of the separator.
#' @param brac A string to brac the values by.
#' @param ellipsis A numeric scalar of the maximum number of values to display
#' before using an ellipsis.
#' @param chk A flag specifying whether to check the other parameters.
#' @inheritParams chk_flag
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
cc <- function(x, conj = ", ", sep = ", ",
               brac = if(is.character(x) || is.factor(x)) "'" else "",
               ellipsis = 10L, chk = TRUE) {
  if(chk) {
    chk_string(conj)
    chk_string(sep)
    chk_s3_class(brac, "character")
    chk_range(length(brac), 1:2)
    chk_whole_number(ellipsis)
    chk_gte(ellipsis, 3)
  }

  if(!length(x)) {
    return(character(0))
  }
  x <- p0(brac[1], x, brac[length(brac)])
  n <- length(x)
  if(n == 1L) {
    return(x)
  }
  if(n == 2L) {
    return(p(x, collapse = conj))
  }
  if(n > ellipsis) {
    x <- c(x[1:(ellipsis - 2)], "...", x[n])
    n <- ellipsis
  }
  p(c(p0(x[1:(n - 1)], collapse = sep), x[n]), collapse = conj)
}
