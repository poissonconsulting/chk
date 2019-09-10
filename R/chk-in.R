#' Check In and Has
#' 
#' Checks if in and has values.
#'
#' @details  
#' 
#' \code{chk_in()}: Check In
#' 
#' Checks if all values in values using equivalent of:
#' 
#' \code{all(\link{match}(x, values, nomatch = 0) > 0)}
#' 
#' @inheritParams chk_true
#' @param err Deprecated.
#' @param values A vector of the permitted values.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @export
#' 
#' @examples 
#' 
#' # chk_in
#' chk_in(numeric(0), 1:10)
#' chk_in(1, 1:10)
#' try(chk_in(11, 1:10))
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_in <- function (x, values, err = TRUE, x_name = NULL) {
  if(all(x %in% values)) return(TRUE)
  if(!err) return(FALSE)
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    stop(x_name, " must match ", cc(values, " or "), ", not ", cc(x), ".", 
         call. = FALSE)
  stop(x_name, " must have values matching ", cc(values, " or "), ".", 
       call. = FALSE)
}

#' @describeIn chk_in Check Has
#' 
#' Checks if includes all values using:
#' 
#' \code{all(\link{match}(values, x, nomatch = 0) > 0)}
#' 
#' @export
#' 
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chk_has <- function(x, values, err = TRUE, x_name = NULL) {
  if(all(values %in% x)) return(TRUE)
  if(!err) return(FALSE)
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  values <- values[!values %in% x]
  stop(x_name, " must include ", cc(values, " and "), ".", 
       call. = FALSE)

}
