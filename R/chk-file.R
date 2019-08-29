#' Check Files or Directories Exist
#' 
#' Checks if files or directorys exist.
#'
#' @details  
#' 
#' \code{chk_file()}: Check Files Exist
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#'  
#' @inheritParams chk_true
#'
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_file
#' try(chk_file(tempfile()))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE){
  if(all(file.exists(x) & !dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!file.exists(x) | dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find file '", x, "'.")
  err("Can't find the following files: ", cc(x, " or "), ".")
}

#' @describeIn chk_file Check Directories Exist
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_dir
#' try(chk_dir(tempfile()))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dir <- function(x, err = TRUE){
  if(all(dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find directory '", x, "'.")
  err("Can't find the following directories: ", cc(x, " or "), ".")
}
