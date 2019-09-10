#' Check ... Unused or Used
#' 
#' Checks if ... is unused or used.
#'
#' @details  
#' 
#' \code{chk_unused()}: Check Unused
#' 
#' Checks if is ... unused using:
#' 
#' \code{!length(\link{list}(...))}
#'  
#' @inheritParams chk_true
#' @param err Deprecated.
#' @param ... Additional arguments.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_unused
#' fun <- function(x, ...) { chk_unused(...); x }
#' fun(1)
#' try(fun(1,2))
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_unused <- function (..., err = TRUE) {
  if(!length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be unused.", call. = FALSE)
}

#' @describeIn chk_unused Check ... Used
#' 
#' Checks if is ... used using:
#' 
#' \code{length(\link{list}(...))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_used
#' fun <- function(x, ...) { chk_used(...); x }
#' try(fun(1))
#' fun(1,2)
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_used <- function (..., err = TRUE) {
  if(length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be used.", call. = FALSE)
}
