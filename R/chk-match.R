#' @describeIn chk_true Check Match
#'
#' \code{all(\link{match}(x, match, nomatch = 0) > 0)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_match <- function (x, match = c(1, Inf), err = TRUE) {
  if(all(x %in% match)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("Values of `", x_name, "` must match ", cc(match, " or "), ".", 
       call. = FALSE)
}

#' @describeIn chk_true Check Values
#'
#' \code{all(\link{match}(x, match, nomatch = 0) > 0)} 
#' unless two non-missing values (in which case considered a value range).
#' 
#' @param values A vector of the permitted value(s). If
#' two non-missing values then it is considered to be a value range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_values <- function (x, values = c(1, Inf), err = TRUE) {
  if(all(x %in% values)) return(TRUE)
  
  if(anyNA(x) && !anyNA(values)) {
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    stop("`", x_name, "` must not have missing values.", call. = FALSE)
  }
  
  is_na <- is.na(values)
  if(sum(!is_na) != 2L || length(unique(values[!is_na])) == 1L) {
    values <- sort(unique(values), na.last = TRUE)
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    if(length(x) == 1) {
      stop("`", x_name, "` must be ", cc(values, " or "), ", not ", 
           cc(x), ".", call. = FALSE)
    }
    stop("All values of `", x_name, "` must be ", cc(values, " or "), 
         ".", call. = FALSE)
  }
  values <- sort(unique(values))
  x_length <- length(x)
  x_name <- deparse(substitute(x))
  x <- x[!is.na(x)]
  if(all(x >= values[1] & x <= values[2])) return(TRUE)
  if(!err) return(FALSE)
  if(x_length == 1L) {
    stop("`", x_name, "` must be between ", cc(values[1:2], " and "), ", not ", 
         cc(x), ".", call. = FALSE)
  }
  stop("All values of `", x_name, "` must be between ", cc(values[1:2], " and "), 
       ".", call. = FALSE)
}

