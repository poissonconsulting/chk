#' @describeIn chk_true Check Directories Exist
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

#' @describeIn chk_true Check Files Exist
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

