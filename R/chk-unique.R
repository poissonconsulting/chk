#' Check Unique
#' 
#' Unique checks.
#'
#' @details  
#' 
#' \code{chk_unique()}: Check Unique
#' 
#' Checks if unique using:
#' 
#' \code{!\link{anyDuplicated}(x, incomparables = incomparables)}
#' @inheritParams chk_true
#' @param incomparables A vector of values that cannot be compared.
#' FALSE means that all values can be compared.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @export
#' 
#' @examples 
#' 
#' # chk_unique
#' chk_unique(NULL)
#' chk_unique(numeric(0))
#' chk_unique(c(NA, 2))
#' try(chk_unique(c(NA, NA, 2)))
#' chk_unique(c(NA, NA, 2), incomparables = NA)
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_unique <- function(x, incomparables = FALSE, err = TRUE, x_name = NULL){
  if(!.anyDuplicated(x, incomparables = incomparables)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be unique.", call. = FALSE)
}

#' @describeIn chk_unique Check No Missing Values
#' 
#' Checks if no missing values using:
#' 
#' \code{!\link{anyNA}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_no_missing
#' try(chk_no_missing(NA))
#' try(chk_no_missing(c(1, NA)))
#' chk_no_missing(character(0))
#' chk_no_missing(1)
#' chk_no_missing(1:10)
#'   
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE, x_name = NULL){
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must not have missing values.", call. = FALSE)
}

#' @describeIn chk_unique Check Named
#' 
#' Checks if is named using:
#' 
#' \code{!is.null(\link{names}(x))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_named
#' try(chk_named(1))
#' try(chk_named(list(1)))
#' chk_named(c(x = 1))
#' chk_named(list(x = 1))
#' chk_named(c(x = 1)[-1])
#' chk_named(list(x = 1)[-1])
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE, x_name = NULL){
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be named.", call. = FALSE)
}
