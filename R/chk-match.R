#' @describeIn chk_flag Check Match
#'
#' \code{all(\link{match}(x, match, nomatch = 0) > 0)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_match <- function (x, match = c(1, Inf), err = TRUE) {
  if(all(x %in% match)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("Values of `", x_name, "` must match ", cc(match, " or "), ".", 
       call. = FALSE)
}
