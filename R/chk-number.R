#' Check/Validate Number or Whole Number
#' 
#' Checks/validates if a number or whole number.
#'
#' @inheritParams chk_true
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @seealso \code{\link{chk_true}()} and \code{\link{chk_range}()}
#' @name chk_number
NULL

#' @describeIn chk_number Check Number
#'  
#' Checks if non-missing numeric scalar using 
#' \code{vld_number()}.
#'  
#' @export
#' 
#' @examples 
#' 
#' # chk_number
#' chk_number(1.1)
#' try(chk_number(TRUE))
chk_number <- function(x, x_name = NULL){
  if(vld_number(x)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  .abort(x_name, " must be a number (non-missing numeric scalar).")
}

#' @describeIn chk_number Validate Number
#'  
#' Validates non-missing numeric scalar using
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x)}
#'  
#' @export
#' 
#' @examples 
#' 
#' # vld_number
#' vld_number(1.1)
#' vld_number(1L)
#' vld_number(TRUE)
#' vld_number(NA_real_)
#' vld_number(c(1.1, 1.1))
vld_number <- function(x) {
  is.numeric(x) && length(x) == 1L && !anyNA(x)
}

#' @describeIn chk_number Check Whole Number
#'  
#' Checks if non-missing integer scalar or double equivalent using 
#' 
#' \code{vld_whole_number()}.
#'   
#' @export
#' 
#' @examples 
#' 
#' # chk_whole_number
#' chk_whole_number(2)
#' try(chk_whole_number(1.1))
chk_whole_number <- function(x, x_name = NULL){
  if(vld_whole_number(x)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  .abort(x_name, 
       " must be a whole number (non-missing integer scalar or double equivalent).")
}

#' @describeIn chk_number Validate Whole Number
#'  
#' Validates non-missing integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && 
#'   (is.integer(x) || isTRUE(all.equal(x, as.integer(x))))}
#'   
#' @export
#' 
#' @examples 
#' 
#' # vld_whole_number
#' vld_whole_number(2)
#' vld_whole_number(2L)
#' vld_whole_number(NA_integer_)
#' vld_whole_number(1.1)
#' vld_whole_number(c(2L, 2L))
vld_whole_number <- function(x) {
  is.numeric(x) && length(x) == 1L && !anyNA(x) && 
    (is.integer(x) || isTRUE(all.equal(x, as.integer(x))))
}
