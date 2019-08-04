#' @describeIn chk_flag Check Length
#' 
#' @param length An integer vector of the permitted length(s). If
#' two values then it is considered to be a length range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_length <- function (x, length = c(1L, 2147483647), err = TRUE) {
  x_length <- length(x)
  length_n <- length(length)

  if(length_n == 1L) {
    if(x_length == length) return(TRUE)
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    stop("`", x_name, "` must be length ", length, ", not length ", x_length, 
         ".", call. = FALSE)
  }
  
  if(length_n == 2L) {
    if(x_length >= min(length) && x_length <= max(length)) return(TRUE)
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    stop("`", x_name, "` must be length ", min(length), " to ", max(length), 
         ", not length ", x_length, ".", call. = FALSE)
  }
  if(length_n == 3L) length <- unique(length)
  if(x_length %in% length) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be length ", cc(length, " or "), 
       ", not length ", x_length, ".", call. = FALSE)
}
