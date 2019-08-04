#' @describeIn chk_flag Check Match
#'
#' \code{all(\link{match}(x, match, nomatch = 0) > 0)}
#' @param match A vector of the permitted value(s). If
#' two non-missing values then it is considered to be a value range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_match <- function (x, match = c(1, Inf), err = TRUE) {
  if(all(x %in% match)) return(TRUE)
  match_not_na <- match[!is.na(match)]
  
  if(length(match_not_na) != 2L) {
    if(!err) return(FALSE)
    if(length(match_not_na) != length(match)) 
      match <- c(match_not_na, NA)
    x_name <- deparse(substitute(x))
    if(length(x) == 1) {
      stop("`", x_name, "` must be ", cc(match, " or "), 
           ", not ", cc(x, " or "), ".", call. = FALSE)
    }
    stop("All values of `", x_name, "` must be ", 
         cc(match, " or "), 
         ".", call. = FALSE)
  }
  x_not_na <- x[!is.na(x)]
  if(!all(x_not_na >= min(match_not_na) & x_not_na <= max(match_not_na))) {
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    if(length(x) == 1) {
      stop("`", x_name, "` must be between ", 
           cc(match_not_na, " and "), 
           ", not ", cc(x, " or "), ".", call. = FALSE)
    }
    stop("All values of `", x_name, "` must be between ", 
         cc(match_not_na, " and "), 
         ".", call. = FALSE)
  }
  if(length(x_not_na) != length(x) && length(match_not_na) == length(match)) {
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    stop("`", x_name, "` must not have missing values.", call. = FALSE)
  }
  TRUE
}
