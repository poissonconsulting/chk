#' @describeIn chk_flag Check Length
#' @param length An integer vector of the permitted length(s). If
#' two values then it is considered to be a length range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/cc.R
chk_length <- function (x, length = c(1L, 2147483647), err = TRUE) {
  n <- length(x)
  nlength <- length(length)

  if(nlength == 1L) {
    if(n == length) return(TRUE)
    if(!err) return(FALSE)
    x <- deparse(substitute(x))
    stop("`", x, "` must be length ", length, 
         ", not length ", n,".", call. = FALSE)
  }
  
  if(nlength == 2L) {
    if(n >= min(length) && n <= max(length)) return(TRUE)
    if(!err) return(FALSE)
    x <- deparse(substitute(x))
    stop("`", x, "` must be length ", min(length), " to ", max(length), 
         ", not length ", n, ".", call. = FALSE)
  }
  if(nlength == 3L) length <- unique(length)
  if(n %in% length) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be length ", cc(length, chk = FALSE), 
       ", not length ", n, ".", call. = FALSE)
}
