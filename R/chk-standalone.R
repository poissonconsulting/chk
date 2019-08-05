#' Check Object
#'
#' @details  
#' 
#' Checks if TRUE using:
#' 
#' \code{\link{isTRUE}(x)}
#'  
#' @param x The object to check. 
#' @param err A flag specifying whether to generate an error
#' message if the check fails.
#' @param class A string specifying the class(es).
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @param match A vector of the permitted value(s).
#' @param pattern A string of a regular expression.
#' @param ... Additional arguments.
#'
#' @return A flag or an error if the check fails and err = TRUE.
#' @name chk_true
#' @aliases chk
#' @export
#'
#' @examples
#' # chk_true
#' chk_true(1, err = FALSE)
#' chk_true(NA, err = FALSE)
#' chk_true(TRUE)
#' chk_true(c(TRUE, FALSE), err = FALSE)
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_true <- function(x, err = TRUE) {
  if(isTRUE(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be TRUE.", 
       call. = FALSE)
}

#' @describeIn chk_true Check False
#' 
#' Checks if FALSE using:
#' 
#' \code{\link{isFALSE}(x)}
#' @export
#' 
#' @examples 
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_false <- function(x, err = TRUE) {
  if(isFALSE(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be FALSE.", 
       call. = FALSE)
}

#' @describeIn chk_true Check Flag
#' 
#' Checks if non-missing logical scalar using:
#' 
#' \code{\link{is.logical}(x) && \link{length}(x) == 1L && !\link{anyNA}(x)}
#' @export
#' 
#' @examples 
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_flag <- function(x, err = TRUE) {
  if(is.logical(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a flag (TRUE or FALSE).", call. = FALSE)
}

#' @describeIn chk_true Check Lgl
#' 
#' Checks if logical scalar using:
#' 
#' \code{\link{is.logical}(x) && \link{length}(x) == 1L && !\link{anyNA}(x)}
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

#' @describeIn chk_true Check Number
#' 
#' Checks if non-mising numeric scalar using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !\link{anyNA}(x)}
#' @export
#' 
#' @examples
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_number <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a number (non-missing numeric scalar).", 
       call. = FALSE)
}

#' @describeIn chk_true Check Whole Number
#'  
#' Checks if non-mising integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !\link{anyNA}(x) && x == as.integer(x)}
#' @export
#' 
#' @examples
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_number <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x == as.integer(x))
    return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a whole number (non-missing integer scalar or double equivalent).", 
       call. = FALSE)
}

#' @describeIn chk_true Check String
#' 
#' \code{\link{is.character}(x) && \link{length}(x) == 1L && !\link{anyNA}(x)}
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE) {
  if(is.character(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must be a string (non-missing character scalar).", 
       call. = FALSE)
}

#' @describeIn chk_true Check Named
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

#' @describeIn chk_true Check NULL
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

#' @describeIn chk_true Check Inherits from Class
#' 
#' Class should be a scalar
#' \code{\link{inherits}(x, class)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_inherits <- function(x, class, err = TRUE) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  stop("`", x_name, "` must inherit from class '", class, "'.", call. = FALSE)
}

#' @describeIn chk_true Check Is Class
#' 
#' \code{\link{identical}(\link{class}(x), class)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE) {
  if(identical(class(x), class)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  class <- gsub("\"", "'", utils::capture.output(dput(class)))
  x_class <- gsub("\"", "'", utils::capture.output(dput(class(x))))
  stop("`", x_name, "` must be class ", class, ", not ", x_class, ".", 
       call. = FALSE)
}

#' @describeIn chk_true Check Identical
#'
#' \code{\link{identical}(x, y)}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_identical <- function (x, y, err = TRUE) {
  if(identical(x, y)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  stop("`", x_name, "` not identical to: ", y, ".")
}

#' @describeIn chk_true Check Equal
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance))}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE) {
  if(isTRUE(all.equal(x, y, tolerance))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  stop("`", x_name, "` not equal to: ", y, ".")
}

#' @describeIn chk_true Check Equivalent
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE) {
  if(isTRUE(all.equal(x, y, tolerance, check.attributes = FALSE))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  stop("`", x_name, "` not equivalent to: ", y, ".")
}

#' @describeIn chk_true Check Matches Regular Expression
#'
#' \code{all(\link{grepl}(pattern, x))}
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_grepl <- function (x, pattern = ".+", err = TRUE) {
  if(all(grepl(pattern, x))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1)
    stop("`", x_name, "` must match regular expression '", pattern, "'.")
  stop("All values of `", x_name, "` must match regular expression '", pattern, "'.")
}

#' @describeIn chk_true Check No Missing Values
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

#' @describeIn chk_true Check Function
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

#' @describeIn chk_true Check ... Unused
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

#' @describeIn chk_true Check ... Used
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

#' @describeIn chk_true Check Directory Exists
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

#' @describeIn chk_true Check File Exists
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
