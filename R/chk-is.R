#' Check Is
#' 
#' Checks if is a particular type of object.
#'
#' @details  
#' 
#' \code{chk_is()}: Check Is
#' 
#' Checks if inherits from class using:
#' 
#' \code{\link{inherits}(x, class)}
#' 
#' Class should be a string.
#'  
#' @inheritParams chk_true
#' @param class A string specifying the class.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_is
#' try(chk_is(1, "character"))
#' try(chk_is(NULL, "numeric"))
#' chk_is(numeric(0), "numeric")
#' chk_is(1, "numeric")
#' chk_is(NA_real_, "numeric")
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE, x_name = NULL) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must inherit from class '", class, "'.", call. = FALSE)
}

#' @describeIn chk_is Check Whole Numeric
#'  
#' Checks if integer vector or double equivalent using the equivalent of:
#' 
#' \code{is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x))))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_whole_numeric
#' try(chk_whole_numeric(TRUE))
#' try(chk_whole_numeric(1.5))
#' chk_whole_numeric(1)
#' chk_whole_numeric(NA_real_)
#' chk_whole_numeric(1:2)
#' chk_whole_numeric(double(0))
#'    
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_numeric <- function(x, err = TRUE, x_name = NULL){
  if(is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, 
      " must be a whole numeric vector (integer vector or double equivalent).",
      call. = FALSE)
}

#' @describeIn chk_is Check List
#' 
#' Checks if is a list using:
#' 
#' \code{\link{is.list}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_list
#' try(chk_list(1))
#' try(chk_list(NULL))
#' chk_list(list())
#' chk_list(list(x = 1))
#' chk_list(mtcars)
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_list <- function(x, err = TRUE, x_name = NULL){
  if(is.list(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a list.", call. = FALSE)
}

#' @describeIn chk_is Check Function
#' 
#' Checks if is a function using:
#' 
#' \code{\link{is.function}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_function
#' try(chk_function(1))
#' try(chk_function(list(1)))
#' chk_function(mean)
#' chk_function(function(x) x)
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_function <- function(x, err = TRUE, x_name = NULL){
  if(is.function(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a function.", call. = FALSE)
}
