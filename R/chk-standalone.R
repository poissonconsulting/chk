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
#' @return A flag or an error if the check fails and err == TRUE.
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
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_flag <- function(x, err = TRUE) {
  if(isTRUE(x) || isFALSE(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be a flag (TRUE or FALSE).", call. = FALSE)
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
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lgl <- function(x, err = TRUE) {
  if(is.logical(x) && identical(length(x), 1L)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be a logical scalar (TRUE, FALSE or NA).", call. = FALSE)
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
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk

chk_number <- function(x, err = TRUE) {
  if(is.numeric(x) && identical(length(x), 1L) && !is.na(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be a number (non-missing numeric scalar).", call. = FALSE)
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
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE) {
  if(is.character(x) && identical(length(x), 1L) && !is.na(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be a string (non-missing character scalar).", call. = FALSE)
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
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE) {
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be named.", call. = FALSE)
}

#' @describeIn chk_flag Check NULL
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_null <- function(x, err = TRUE) {
  if(is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be NULL.", call. = FALSE)
}

#' @describeIn chk_flag Check function
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_function <- function(x, err = TRUE) {
  if(is.function(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must be a function.", call. = FALSE)
}

#' @describeIn chk_flag Check inherits from class
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  x_class <- class(x)
  x_class <- x_class[length(x_class)]
  x <- deparse(substitute(x))
  stop("`", x, "` must inherit from class '", class, "', not class '", x_class, "'.", 
       call. = FALSE)
}

#' @describeIn chk_flag Check no missing values
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE) {
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x <- deparse(substitute(x))
  stop("`", x, "` must not have missing values.", call. = FALSE)
}

#' @describeIn chk_flag Check unused
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unused <- function (..., err = TRUE) {
  if(!length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be unused.", call. = FALSE)
}

#' @describeIn chk_flag Check used
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_used <- function (..., err = TRUE) {
  if(length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be used.", call. = FALSE)
}

#' @describeIn chk_flag Check directory exists
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dir <- function(x, err = TRUE) {
  if(dir.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  stop("Can't find directory `", x, "`.", call. = FALSE)
}

#' @describeIn chk_flag Check file exists
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE) {
  if(file.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  stop("Can't find file `", x, "`.", call. = FALSE)
}
