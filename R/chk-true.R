#' Check TRUE or FALSE
#' 
#' Checks if object is TRUE or FALSE.
#'
#' @details  
#' 
#' \code{chk_true()}: Check TRUE
#' 
#' Checks if TRUE using:
#' 
#' \code{\link{isTRUE}(x)}
#'  
#' @param x The object to check. 
#' @param err A flag specifying whether to generate an error
#' message if the check fails.
#' @param x_name A string of the name of object x or NULL.
#'
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @seealso \code{\link{chk_number}()}
#' @export
#'
#' @examples
#' 
#' # chk_true
#' try(chk_true(1))
#' try(chk_true(NA))
#' try(chk_true(FALSE))
#' chk_true(TRUE)
#' try(chk_true(c(TRUE, TRUE)))
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_true <- function(x, err = TRUE, x_name = NULL){
  if(isTRUE(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be TRUE.", call. = FALSE)
}

#' @describeIn chk_true Check FALSE
#' 
#' Checks if FALSE using:
#' 
#' \code{\link{isFALSE}(x)}
#' 
#' @export
#' 
#' @examples
#' 
#' # chk_false
#' try(chk_false(0))
#' try(chk_false(NA))
#' try(chk_false(TRUE))
#' chk_false(FALSE)
#' try(chk_false(c(FALSE, FALSE)))
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_false <- function(x, err = TRUE, x_name = NULL){
  if(isFALSE(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be FALSE.", call. = FALSE)
}

#' @describeIn chk_true Check Flag
#' 
#' Checks if non-missing logical scalar using:
#' 
#' \code{is.logical(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_flag
#' try(chk_flag(1))
#' try(chk_flag(NA))
#' chk_flag(TRUE)
#' chk_flag(FALSE)
#' try(chk_flag(c(TRUE, TRUE)))
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_flag <- function(x, err = TRUE, x_name = NULL){
  if(is.logical(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a flag (TRUE or FALSE).", call. = FALSE)
}

#' @describeIn chk_true Check Lgl
#' 
#' Checks if logical scalar using:
#' 
#' \code{is.logical(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_lgl
#' try(chk_lgl(1))
#' chk_lgl(NA)
#' chk_lgl(TRUE)
#' chk_lgl(FALSE)
#' try(chk_lgl(c(TRUE, TRUE)))
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_lgl <- function(x, err = TRUE, x_name = NULL){
  if(is.logical(x) && length(x) == 1L) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a logical scalar (TRUE, FALSE or NA).", call. = FALSE)
}
