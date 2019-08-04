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
  if(is.logical(x) && length(x) == 1L && !is.na(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a flag (TRUE or FALSE).", call. = FALSE)
}

#' @describeIn chk_flag Check Logical Scalar
#' @export
#' 
#' @examples 
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lgl <- function(x, err = TRUE) {
  if(is.logical(x) && length(x) == 1L) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a logical scalar (TRUE, FALSE or NA).", 
       call. = FALSE)
}

#' @describeIn chk_flag Check Number (non-mising numeric scalar)
#' @export
#' 
#' @examples
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk

chk_number <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !is.na(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a number (non-missing numeric scalar).", 
       call. = FALSE)
}

#' @describeIn chk_flag Check String
#' 
#' A string is a non-mising character scalar.
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE) {
  if(is.character(x) && length(x) == 1L && !is.na(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a string (non-missing character scalar).", 
       call. = FALSE)
}

#' @describeIn chk_flag Check Named
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE) {
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be named.", call. = FALSE)
}

#' @describeIn chk_flag Check NULL
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_null <- function(x, err = TRUE) {
  if(is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be NULL.", call. = FALSE)
}

#' @describeIn chk_flag Check Inherits from Class
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  x_class <- class(x)
  x_class <- x_class[length(x_class)]
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must inherit from class '", class, "', not class '", 
       x_class, "'.", call. = FALSE)
}

#' @describeIn chk_flag Check Dim
#' @param dim An integer vector (or object that can be converted to an integer vector)
#'  of the dimensions of x.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dim <- function(x, dim, err = TRUE) {
  dim <- as.integer(dim)
  if(identical(dim(x), as.integer(dim))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  dim <- paste0(dim, collapse = " ")
  x_dim <- paste(dim(x), collapse = " ")
  stop("`", x_name, "` dim must be '", dim, "', not '", 
       x_dim, "'.", call. = FALSE)
}

#' @describeIn chk_flag Check No Missing Values
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE) {
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must not have missing values.", call. = FALSE)
}

#' @describeIn chk_flag Check Function
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_function <- function(x, err = TRUE) {
  if(is.function(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a function.", call. = FALSE)
}

#' @describeIn chk_flag Check ... Unused
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unused <- function (..., err = TRUE) {
  if(!length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be unused.", call. = FALSE)
}

#' @describeIn chk_flag Check ... Used
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_used <- function (..., err = TRUE) {
  if(length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  stop("`...` must be used.", call. = FALSE)
}

#' @describeIn chk_flag Check Directory Exists
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dir <- function(x, err = TRUE) {
  if(dir.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  stop("Can't find directory `", x, "`.", call. = FALSE)
}

#' @describeIn chk_flag Check File Exists
#' 
#' A directory is considered to be a file.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE) {
  if(file.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  stop("Can't find file `", x, "`.", call. = FALSE)
}
