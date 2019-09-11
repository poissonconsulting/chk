#' Check Number or Whole Number
#' 
#' @inheritParams chk_true
#' @return \code{NULL}, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso \code{\link{chk_true}()}, \code{\link{chk_range}()}
#' and \code{\link{chk_whole_numeric}()}
#' @name chk_number
NULL

#' Check Number
#' 
#' @description 
#' 
#' \code{chk_number()}
#' checks if non-missing numeric scalar using 
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x)}.
#' 
#' \strong{Good}: \code{1}, \code{2L}, \code{log(10)}, \code{-Inf}.
#' 
#' \strong{Bad}: \code{"a"}, \code{1:3}, \code{NA_real_}.
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
  if(is.null(x_name))  x_name <- deparse_tick(substitute(x))
  .abort(x_name, " must be a number (non-missing numeric scalar).")
}

#' @export
#' @rdname vld
#' 
#' @examples 
#' vld_number(1.1)
vld_number <- function(x) {
  is.numeric(x) && length(x) == 1L && !anyNA(x)
}

#' Check Whole Number
#'  
#' @description
#' 
#' \code{chk_whole_number()}
#'  checks if non-missing integer scalar or double equivalent using
#' 
#' \code{chk_number(x)} and \code{is.integer(x) || isTRUE(all.equal(x, trunc(x)))}.
#'   
#' \strong{Good}: \code{1}, \code{2L}, \code{1e10}, \code{-Inf}.
#' 
#' \strong{Bad}: \code{"a"}, \code{1:3}, \code{NA_integer_}, \code{log(10)}.
#' 
#' The \code{\link{chk_whole_numeric}()} function checks if 
#' integer vector of any length or double equivalent.
#' 
#' @export
#' @rdname chk_number
#' 
#' @examples 
#' 
#' # chk_whole_number
#' chk_whole_number(2)
#' try(chk_whole_number(1.1))
chk_whole_number <- function(x, x_name = NULL){
  if(vld_whole_number(x)) return(invisible())
  if(is.null(x_name))  x_name <- deparse_tick(substitute(x))
  .abort(x_name, 
       " must be a whole number (non-missing integer scalar or double equivalent).")
}

#' @export
#' @rdname vld
#' 
#' @export
#' 
#' @examples 
#' vld_whole_number(2)
vld_whole_number <- function(x) {
  vld_number(x) && 
    (is.integer(x) || isTRUE(all.equal(x, trunc(x))))
}
