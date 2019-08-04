#' @describeIn chk_flag Check Values
#' Missing values are ignored
#' @param values A vector of the permitted value(s). If
#' two values then it is considered to be a value range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/cc.R
chk_values <- function (x, values = c(-Inf, Inf, NA), err = TRUE) {
  return(TRUE)
}
