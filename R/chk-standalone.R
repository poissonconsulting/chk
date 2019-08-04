#' Check Object
#'
#' A flag is a non-missing logical scalar.
#' 
#' \code{\link{is.logical}(x) && \link{length}(x) == 1L && !\link{is.na}(x)}
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
#' 
#' \code{\link{is.logical}(x) && \link{length}(x) == 1L && !\link{is.na}(x)}
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
#' 
#' \code{\link{is.numeric}(x) && \link{length}(x) == 1L && !\link{is.na}(x)}
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
#' \code{\link{is.character}(x) && \link{length}(x) == 1L && !\link{is.na}(x)}
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
#' 
#' \code{!\link{is.null}(\link{names}(x))}
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
#' 
#' \code{\link{is.null}(x)}
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
#' 
#' \code{\link{inherits}(x, class)}
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

#' @describeIn chk_flag Check Identical
#'
#' \code{\link{identical}(x, y)}
#' @param y The object to check against.
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
#  depends on R/paste.R
chk_identical <- function (x, y, err = TRUE) {
  if(identical(x, y)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop()
}

#' @describeIn chk_flag Check No Missing Values
#' 
#' \code{!\link{anyNA}(x)}
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
#' 
#' \code{\link{is.function}(x)}
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
#' 
#' \code{!\link{length}(\link{list}(...))}
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
#' 
#' \code{\link{length}(\link{list}(...))}
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
#' 
#' \code{\link{dir.exists}(x)}
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
#' \code{\link{file.exists}(x)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE) {
  if(file.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  stop("Can't find file `", x, "`.", call. = FALSE)
}
