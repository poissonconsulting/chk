#' @describeIn chk_flag Check Values
#'
#' Checks if all x are in values.
#' @param values A vector of the permitted value(s). If
#' two non-missing values then it is considered to be a value range.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_values <- function (x, values = c(0, Inf, NA), err = TRUE) {
  if(all(x %in% values)) return(TRUE)
  values_not_na <- values[!is.na(values)]
  
  if(length(values_not_na) != 2L) {
    if(!err) return(FALSE)
    if(length(values_not_na) != length(values)) 
      values <- c(values_not_na, NA)
    brac_x <- if(is.character(x)) "'" else ""
    brac_values <- if(is.character(values)) "'" else ""
    x_name <- deparse(substitute(x))
    if(length(x) == 1) {
      stop("`", x_name, "` must be ", cc(values, brac = brac_values), 
           ", not ", cc(x, brac = brac_x), ".", call. = FALSE)
    }
    stop("All values of `", x_name, "` must be ", 
         cc(values, brac = brac_values), 
         ".", call. = FALSE)
  }
  x_not_na <- x[!is.na(x)]
  if(!all(x_not_na >= min(values_not_na) & x_not_na <= max(values_not_na))) {
    if(!err) return(FALSE)
    brac_x <- if(is.character(x)) "'" else ""
    brac_values <- if(is.character(values)) "'" else ""
    x_name <- deparse(substitute(x))
    if(length(x) == 1) {
      stop("`", x_name, "` must be between ", 
           cc(values_not_na, conj = " and ", brac = brac_values), 
           ", not ", cc(x, brac = brac_x), ".", call. = FALSE)
    }
    stop("All values of `", x_name, "` must be between ", 
         cc(values_not_na, conj = " and ", brac = brac_values), 
         ".", call. = FALSE)
  }
  if(length(x_not_na) != length(x) && length(values_not_na) == length(values)) {
    if(!err) return(FALSE)
    x_name <- deparse(substitute(x))
    stop("`", x_name, "` must not have missing values.", call. = FALSE)
  }
  TRUE
}
