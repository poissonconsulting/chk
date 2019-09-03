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
#' @param values A vector of the permitted values.
#' @param regexp A string of a regular expression.
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
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unique <- function(x, incomparables = FALSE, err = TRUE, x_name = NULL){
  if(!anyDuplicated(x, incomparables = incomparables)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  err(x_name, " must be unique.")
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
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE, x_name = NULL){
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  err(x_name, " must not have missing values.")
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
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE, x_name = NULL){
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  err(x_name, " must be named.")
}

#' @describeIn chk_unique Check In
#' 
#' Checks if all values in values using equivalent of:
#' 
#' \code{all(\link{match}(x, values, nomatch = 0) > 0)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_in
#' chk_in(numeric(0), 1:10)
#' chk_in(1, 1:10)
#' try(chk_in(11, 1:10))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_in <- function (x, values = c(0, 1, NA), err = TRUE, x_name = NULL) {
  if(all(x %in% values)) return(TRUE)
  if(!err) return(FALSE)
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must match ", cc(values, " or "), ", not ", cc(x), ".")
  err(x_name, " must have values matching ", cc(values, " or "), ".")
}

#' @describeIn chk_unique Check Matches
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
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_match <- function (x, regexp = ".+", err = TRUE, x_name = NULL) {
  if(all(grepl(regexp, x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must match regular expression '", regexp, "'.")
    err(x_name, " must have values matching regular expression '", regexp, "'.")
}
