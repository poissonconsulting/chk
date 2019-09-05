#' @describeIn chk_file Check Directories Exist (DEPRECATED)
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_dirs <- function(x, err = TRUE){
  .Deprecated("chk_dir")
  chk_dir(x, err = err)
}

#' @describeIn chk_file Check Files Exist (DEPRECATED)
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#' 
#' @export
#
#  Licence: CC0
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
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_length <- function(x, length = 1L, err = TRUE, x_name = NULL) {
  .Deprecated("chk_range(length(x))")
  if(length(x) == length) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be length ", length, ", not ", length(x), ".", call. = FALSE)
}


#' @describeIn chk_number Check Count
#'  
#' Checks if non-missing non-negative integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
#'   isTRUE(all.equal(x, as.integer(x)))}
#'   
#' @export
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_count <- function(x, err = TRUE, x_name = NULL){
  .Deprecated("chk_whole_number(x); chk_gte(x)")

  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, 
       " must be a count (non-missing non-negative integer scalar or double equivalent).", 
       call. = FALSE)
}


#' @describeIn chk_number Check Proportion
#' 
#' Checks if non-missing numeric scalar between 0 and 1 using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1}
#' 
#' @export
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_proportion <- function(x, err = TRUE, x_name = NULL){
  .Deprecated("chk_number(x); chk_range(x)")
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) 
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, 
       " must be a proportion (non-missing numeric scalar between 0 and 1).", 
       call. = FALSE)
}
