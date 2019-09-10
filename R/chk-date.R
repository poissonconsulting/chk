#' Check Date
#' 
#' Checks if date or datetime.
#'
#' @details  
#' 
#' \code{chk_date()}: Check Date
#' 
#' Checks if non-missing Date scalar using:
#' 
#' \code{inherits(x, "Date") && length(x) == 1L && !anyNA(x)}
#'  
#' @inheritParams chk_true
#' @param err Deprecated.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @seealso \code{\link{chk_true}()} and \code{\link{chk_number}()}
#' @export
#' 
#' @examples 
#' 
#' # chk_date
#' try(chk_date(1))
#' try(chk_date("2001-01-02"))
#' chk_date(as.Date("2001-01-02"))
#' chk_date(Sys.Date())
#' try(chk_date(Sys.time()))
#' try(chk_date(c(Sys.Date(), Sys.Date())))
#'   
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_date <- function(x, err = TRUE, x_name = NULL){
  if(inherits(x, "Date") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a date (non-missing Date scalar).", call. = FALSE)
}

#' @describeIn chk_date Check DateTime
#' 
#' Checks if non-missing POSIXct scalar using:
#' 
#' \code{inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_datetime
#' try(chk_datetime(1))
#' try(chk_datetime("2001-01-02"))
#' chk_datetime(as.POSIXct("2001-01-02"))
#' try(chk_datetime(Sys.Date()))
#' chk_datetime(Sys.time())
#' try(chk_datetime(c(Sys.time(), Sys.time())))
#'    
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_datetime <- function(x, err = TRUE, x_name = NULL){
  if(inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a datetime (non-missing POSIXct scalar).", call. = FALSE)
}
