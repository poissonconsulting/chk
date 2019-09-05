#' Check Scalar
#' 
#' Checks if a non-missing scalar of a specific type.
#'
#' @details  
#' 
#' \code{chk_number()}: Check Number
#' 
#' Checks if non-missing numeric scalar using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x)}
#'  
#' @inheritParams chk_true
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @seealso \code{\link{chk_true}()} and \code{\link{chk_range}()}
#' @export
#' 
#' @examples 
#' 
#' # chk_number
#' try(chk_number(TRUE))
#' chk_number(1.1)
#' chk_number(1L)
#' try(chk_number(NA_real_))
#' try(chk_number(c(1.1, 1.1)))
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_number <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a number (non-missing numeric scalar).", call. = FALSE)
}

#' @describeIn chk_number Check Whole Number
#'  
#' Checks if non-missing integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && 
#'   (is.integer(x) || isTRUE(all.equal(x, as.integer(x))))}
#'   
#' @export
#' 
#' @examples 
#' 
#' # chk_whole_number
#' try(chk_whole_number(1.1))
#' chk_whole_number(2)
#' chk_whole_number(2L)
#' try(chk_whole_number(NA_integer_))
#' try(chk_whole_number(c(2L, 2L)))
#'   
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_number <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, 
       " must be a whole number (non-missing integer scalar or double equivalent).",
       call. = FALSE)
}
