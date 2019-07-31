#' Concatenate with Commas
#' 
#' Concatenates object values into a string with each value separated by a comma
#' and the last value separated by a conjunction. 
#' 
#' If x has more than 10 values an ellipsis is used to ensure only 10 values 
#' are displayed (including the ellipsis)
#'
#' @param x The object to concatenate.
#' @param con A string of the conjunction to separate the last value by.
#' @param bracket A string to bracket the values by.
#' @param chk A flag specifying whether to check the other arguments.
#'
#' @return A string.
#' @export
#'
#' @examples
#' cc(1:2)
#' cc(1:2, con = ",")
#' cc(3:1, bracket = "'")
#' cc(1:11)
cc <- function(x, con = " or ", bracket = "", chk = TRUE) {
  if(isTRUE(chk)) {
    chk_string(con)
    chk_string(bracket)
  }
  
  if(!length(x)) return(character(0))
  x <- p0(bracket, x, bracket)
  x <- unique(x)
  n <- length(x)
  if(n == 1L) return(x)
  if(n == 2L) return(p(x, collapse = con))
  if(n > 10) {
    x <- c(x[1:8], "...", x[n])
    n <- 10
  }
  p(c(p0(x[1:(n-1)], collapse = ", "), x[n]), collapse = con)
}
