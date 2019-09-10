#' @describeIn chk_file Check Directories Exist (DEPRECATED)
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
chk_dirs <- function(x){
  .Deprecated("chk_dir")
  chk_dir(x)
}

#' @describeIn chk_file Check Files Exist (DEPRECATED)
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#' 
#' @export
chk_files <- function(x){
  .Deprecated("chk_file")
  chk_file(x)
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
chk_length <- function(x, length = 1L, x_name = NULL) {
  .Deprecated("chk_range(length(x))")
  if(length(x) == length) return(TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  abort(p0(x_name, " must be length ", length, ", not ", length(x), "."))
}


#' @describeIn chk_number Check Count
#'  
#' Checks if non-missing non-negative integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
#'   isTRUE(all.equal(x, as.integer(x)))}
#'   
#' @export
chk_count <- function(x, x_name = NULL){
  .Deprecated("chk_whole_number(x); chk_gte(x)")

  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  abort(p0(x_name, 
       " must be a count (non-missing non-negative integer scalar or double equivalent)."))
}


#' @describeIn chk_number Check Proportion
#' 
#' Checks if non-missing numeric scalar between 0 and 1 using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1}
#' 
#' @export
chk_proportion <- function(x, x_name = NULL){
  .Deprecated("chk_number(x); chk_range(x)")
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) 
    return(TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  abort(p0(x_name, 
       " must be a proportion (non-missing numeric scalar between 0 and 1)."))
}
