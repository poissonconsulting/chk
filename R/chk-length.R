#' @describeIn chk_flag Check length
#' @param length An integer vector of the permitted lengths. If
#' two values then it is considered to be a length range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/cc.R
chk_length <- function (x, length = c(1L, 2147483647), err = TRUE) {
  n <- length(x)
  
  if(all(length == length[1])) length <- length[1]
  
  if(length(length) == 1L) {
    if(n == length) return(TRUE)
    if(!err) return(FALSE)
    x <- deparse(substitute(x))
    stop("`", x, "` must be length ", length, 
         ", not length ", n,".", call. = FALSE)
  }
  
  length <- sort(length)
  
  if(length(length) == 2L) {
    if(n >= length[1] && n <= length[2]) return(TRUE)
    if(!err) return(FALSE)
    x <- deparse(substitute(x))
    stop("`", x, "` must be length ", length[1], " to ", length[2], 
         ", not length ", n, ".", call. = FALSE)
  }
  length <- unique(length)

  if(n %in% length) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be length ", cc(length, chk = FALSE), 
       ", not length ", n, ".", call. = FALSE)
}
