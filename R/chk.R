#' Check Object
#'
#' A flag is a non-missing logical scalar.
#' 
#' @param x The object to check. 
#' @param err A flag specifying whether to generate an error
#' message if the check fails.
#' @param class A string specifying the class.
#' @param ... Additional arguments.
#'
#' @return A flag or an error if the check fails and \code{isTRUE(err)}.
#' @name chk_flag
#' @aliases chk
#' @export
#'
#' @examples
#' # chk_flag
#' chk_flag(1, err = FALSE)
#' chk_flag(NA, err = FALSE)
#' chk_flag(TRUE)
#' chk_flag(c(TRUE, FALSE), err = FALSE)
chk_flag <- function(x, err = TRUE) {
  if(isTRUE(x) || isFALSE(x)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be a flag (TRUE or FALSE)")
}

#' @describeIn chk_flag Check logical Scalar
#' @export
#' 
#' @examples 
#' 
#' # chk_lgl
#' chk_lgl(1, err = FALSE)
#' chk_lgl(NA)
#' chk_lgl(TRUE)
#' chk_lgl(c(TRUE, FALSE), err = FALSE)
chk_lgl <- function(x, err = TRUE) {
  if(is.logical(x) && identical(length(x), 1L)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be a logical scalar (TRUE, FALSE or NA)")
}

#' @describeIn chk_flag Check number (non-mising numeric scalar)
#' @export
#' 
#' @examples
#' 
#' # chk_number
#' chk_number(TRUE, err = FALSE)
#' chk_number(1L)
#' chk_number(1.1)
#' chk_number(-3)
chk_number <- function(x, err = TRUE) {
  if(is.numeric(x) && identical(length(x), 1L) && !is.na(x)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be a number (non-missing numeric scalar)")
}

#' @describeIn chk_flag Check string (non-mising character scalar)
#' @export
#' 
#' @examples
#' 
#' # chk_string
#' chk_string(1, err = FALSE)
#' chk_string(NA_character_, err  = FALSE)
#' chk_string("")
#' chk_string(c("a", "b"), err = FALSE)
chk_string <- function(x, err = TRUE) {
  if(is.character(x) && identical(length(x), 1L) && !is.na(x)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be a string (non-missing character scalar)")
}

#' @describeIn chk_flag Check named
#' @export
#' 
#' @examples
#' 
#' # chk_named
#' chk_named(1, err = FALSE)
#' chk_named(list(), err = FALSE)
#' chk_named(c(x = 1))
#' chk_named(list(x = 1))
#' chk_named(c(x = 1)[-1])
chk_named <- function(x, err = TRUE) {
  if(!is.null(names(x))) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be named")
}

#' @describeIn chk_flag Check NULL
#' @export
chk_null <- function(x, err = TRUE) {
  if(is.null(x)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be NULL")
}

#' @describeIn chk_flag Check function
#' @export
chk_function <- function(x, err = TRUE) {
  if(is.function(x)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must be a function")
}

#' @describeIn chk_flag Check inherits from class
#' @export
chk_is <- function(x, class, err = TRUE) {
  if(inherits(x, class)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must inherit from ", class)
}

#' @describeIn chk_flag Check unused
#' @export
chk_unused <- function (..., err = TRUE) {
  if(!length(list(...))) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  err("... must be unused")
}

#' @describeIn chk_flag Check used
#' @export
chk_used <- function (..., err = TRUE) {
  if(length(list(...))) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  err("... must be used")
}

#' @describeIn chk_flag Check length
#' @param length An integer vector of the permitted lengths. If
#' two values then it is considered to be a length range.
#' @export
chk_length <- function (x, length = c(1L, 2147483647), err = TRUE) {
  n <- length(x)
  
  if(all(length == length[1])) length <- length[1]
  
  if(length(length) == 1L) {
    if(n == length) return(TRUE)
    if(!isTRUE(err)) return(FALSE)
    x <- deparse(substitute(x))
    err(x, " must have a length of ", length)
  }
  
  length <- sort(length)
  
  if(length(length) == 2L) {
    if(n >= length[1] && n <= length[2]) return(TRUE)
    if(!isTRUE(err)) return(FALSE)
    x <- deparse(substitute(x))
    err(x, " must have a length between ", length[1], " and ", length[2])
  }
  length <- unique(length)

  if(n %in% length) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  x <- deparse(substitute(x))
  err(x, " must have a length of ", cc(length, chk = FALSE))
}
