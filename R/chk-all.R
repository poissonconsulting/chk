#' Check All or All Identical
#' 
#' Checks all elements.
#'
#' @details  
#' 
#' \code{chk_all()}: Check All
#' 
#' Checks all elements using:
#' 
#' \code{all(vapply(x, chk_fun, TRUE, ...))}
#'  
#' @inheritParams chk_true
#' @inheritParams chk_unused
#' @param chk_fun A chk function.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_all
#' try(chk_all(1, chk_lgl))
#' chk_all(TRUE, chk_lgl)
#' chk_all(c(TRUE, NA), chk_lgl)
#' chk_all(numeric(0), chk_lgl)
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_all <- function(x, chk_fun, ..., err = TRUE, x_name = NULL) {
  if(is.null(x)) {
    if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
    return(chk_fun(x, ..., err = err, x_name = x_name))
  }
  args <- list(...)
  args$X <- x
  args$FUN <- chk_fun
  args$FUN.VALUE <- TRUE
  args$err <- FALSE
  
  if(all(do.call("vapply", args))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  x_name <- paste0("All elements of ", x_name)
  args$err <- TRUE
  args$x_name <- x_name
  do.call("vapply", args)
}

#' @describeIn chk_all Check All Identical
#' 
#' Checks all elements in x identical using:
#' 
#' \code{all(vapply(x, identical, TRUE, y = x[[1]]))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_all_identical
#' try(chk_all_identical(1, 1.0000001))
#' chk_all_identical(1, 1.00000001)
#' chk_all_identical(1, 1L)
#' try(chk_all_identical(c(1,2)))
#' try(chk_all_identical(c(1,2.0000001)))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_all_identical <- function(x, err = TRUE, x_name = NULL) {
  if(length(x) < 2L || all(vapply(x, identical, TRUE, y = x[[1]]))) return(TRUE)
  if(!err) return(FALSE)

  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  err(x_name, " must have identical elements.")
}
