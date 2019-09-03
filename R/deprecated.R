#' @describeIn chk_true Check Directories Exist (DEPRECATED)
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dirs <- function(x, err = TRUE){
  .Deprecated("chk_dir")
  chk_dir(x, err = err)
}

#' @describeIn chk_true Check Files Exist (DEPRECATED)
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_files <- function(x, err = TRUE){
  .Deprecated("chk_file")
  chk_file(x, err = err)
}

#' @describeIn chk_unique Check Length
#'
#' 
#' Checks if is length length using:
#' 
#' \code{length(x) == length}
#' 
#' \code{length} should be a count.
#'  
#' @param length A count of the length.
#' 
#' @export
#'
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_length <- function(x, length = 1L, err = TRUE, x_name = NULL) {
  .Deprecated("chk_range(length(x))")
  if(length(x) == length) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  err(x_name, " must be length ", length, ", not ", length(x), ".")
}
