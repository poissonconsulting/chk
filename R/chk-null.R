#' Check NULL or not NULL
#' 
#' Checks if NULL or not NULL.
#'
#' @details  
#' 
#' \code{chk_null()}: Check NULL
#' 
#' Checks if NULL using:
#' 
#' \code{\link{is.null}(x)}
#'  
#' @inheritParams chk_true
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_null
#' try(chk_null(1))
#' chk_null(NULL)
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_null <- function(x, x_name = NULL){
  if (vld_null(x)) return()
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be NULL.", call. = FALSE)
}

#' @export
vld_null <- function(x){
  is.null(x)
}

#' @describeIn chk_null Check Not NULL
#' 
#' Checks if not NULL using:
#' 
#' \code{!\link{is.null}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_not_null
#' try(chk_not_null(NULL))
#' chk_not_null(1)
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_not_null <- function(x, x_name = NULL){
  if (vld_not_null(x)) return()
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must not be NULL.", call. = FALSE)
}

#' @export
vld_not_null <- function(x){
  !is.null(x)
}
