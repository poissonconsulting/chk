#' Check String
#' 
#' Check if string.
#'
#' @details  
#' 
#' \code{chk_-string()}: Check String
#' 
#' Checks if non-missing character scalar using:
#' 
#' \code{is.character(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @inheritParams chk_true
#' @param err Deprecated.
#' @param regexp A string of a regular expression.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_string
#' try(chk_string(1))
#' chk_string("1")
#' chk_string("")
#' try(chk_string(NA_character_))
#' try(chk_string(c("1", "1")))
#'  
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE, x_name = NULL){
  if(is.character(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  stop(x_name, " must be a string (non-missing character scalar).", call. = FALSE)
}

#' @describeIn chk_string Check Matches
#' 
#' Checks if all values match regular expression using:
#'
#' \code{all(\link{grepl}(regexp, x))}
#' 
#' \code{regexp} should be a non-missing character scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_match
#' try(chk_match(""))
#' chk_match("1")
#' try(chk_match("1", regexp = "2"))
#' try(chk_match(NA_character_, regexp = ".*"))
#' chk_match(c("a"), regexp = ".*")
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_match <- function (x, regexp = ".+", err = TRUE, x_name = NULL) {
  if(all(grepl(regexp, x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    stop(x_name, " must match regular expression '", regexp, "'.", call. = FALSE)
    stop(x_name, " must have values matching regular expression '", regexp, "'.",
         call. = FALSE)
}
