#' Check Object
#' 
#' Efficiently checks object.
#'
#' @details  
#' 
#' \code{chk_true()}: Check TRUE
#' 
#' Checks if TRUE using:
#' 
#' \code{\link{isTRUE}(x)}
#'  
#' @param x The object to check. 
#' @param err A flag specifying whether to generate an error
#' message if the check fails.
#' @param mode A string naming an atomic mode or "list" or "expression" or "any".
#' @param class A string specifying the class.
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @param values A vector of the permitted values.
#' @param value A non-missing scalar of a value.
#' @param range A vector of length 2 of the lower and upper permitted values.
#' @param pattern A string of a regular expression.
#' @param ... Additional arguments.
#'
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' @name chk_true
#' @aliases chk
#' @export
#'
#' @examples
#' 
#' # chk_true
#' chk_true(1, err = FALSE)
#' chk_true(NA, err = FALSE)
#' chk_true(FALSE, err = FALSE)
#' chk_true(TRUE)
#' chk_true(c(TRUE, TRUE), err = FALSE)
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_true <- function(x, err = TRUE) {
  if(isTRUE(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be TRUE.")
}

#' @describeIn chk_true Check FALSE
#' 
#' Checks if FALSE using:
#' 
#' \code{\link{isFALSE}(x)}
#' 
#' @export
#' 
#' @examples
#' 
#' # chk_false
#' chk_false(0, err = FALSE)
#' chk_false(NA, err = FALSE)
#' chk_false(TRUE, err = FALSE)
#' chk_false(FALSE)
#' chk_false(c(FALSE, FALSE), err = FALSE)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_false <- function(x, err = TRUE) {
  if(isFALSE(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be FALSE.")
}

#' @describeIn chk_true Check Flag
#' 
#' Checks if non-missing logical scalar using:
#' 
#' \code{is.logical(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_flag
#' chk_flag(1, err = FALSE)
#' chk_flag(NA, err = FALSE)
#' chk_flag(TRUE)
#' chk_flag(FALSE)
#' chk_flag(c(TRUE, TRUE), err = FALSE)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_flag <- function(x, err = TRUE) {
  if(is.logical(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a flag (TRUE or FALSE).")
}

#' @describeIn chk_true Check Lgl
#' 
#' Checks if logical scalar using:
#' 
#' \code{is.logical(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_lgl
#' chk_lgl(1, err = FALSE)
#' chk_lgl(NA)
#' chk_lgl(TRUE)
#' chk_lgl(FALSE)
#' chk_lgl(c(TRUE, TRUE), err = FALSE)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lgl <- function(x, err = TRUE) {
  if(is.logical(x) && length(x) == 1L) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a logical scalar (TRUE, FALSE or NA).")
}

#' @describeIn chk_true Check Number
#' 
#' Checks if non-mising numeric scalar using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_number <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a number (non-missing numeric scalar).")
}

#' @describeIn chk_true Check Proportion
#' 
#' Checks if non-mising numeric scalar between 0 and 1 using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_proportion <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) 
    return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, 
      "` must be a proportion (non-missing numeric scalar between 0 and 1).")
}

#' @describeIn chk_true Check Whole Number
#'  
#' Checks if non-mising integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && 
#'   (is.integer(x) || isTRUE(all.equal(x, as.integer(x))))}
#'   
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_number <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, 
      "` must be a whole number (non-missing integer scalar or double equivalent).")
}

#' @describeIn chk_true Check Count
#'  
#' Checks if non-missing non-negative integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
#'   isTRUE(all.equal(x, as.integer(x)))}
#'   
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_count <- function(x, err = TRUE) {
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
     isTRUE(all.equal(x, as.integer(x))))
    return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, 
      "` must be a count (non-missing non-negative integer scalar or double equivalent).")
}

#' @describeIn chk_true Check String
#' 
#' Checks if non-missing character scalar using:
#' 
#' \code{is.character(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE) {
  if(is.character(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a string (non-missing character scalar).")
}

#' @describeIn chk_true Check String
#' 
#' Checks if non-missing Date scalar using:
#' 
#' \code{inherits(x, "Date") && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_date <- function(x, err = TRUE) {
  if(inherits(x, "Date") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a date (non-missing Date scalar).")
}

#' @describeIn chk_true Check DateTime
#' 
#' Checks if non-missing POSIXct scalar using:
#' 
#' \code{inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_datetime <- function(x, err = TRUE) {
  if(inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a datetime (non-missing POSIXct scalar).")
}

#' @describeIn chk_true Check Scalar
#' 
#' Checks if scalar using:
#' 
#' \code{is.vector(x, mode = mode) && length(x) == 1L}
#' 
#' \code{mode} should be a string.
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_scalar <- function(x, mode = "any", err = TRUE) {
  if(is.vector(x, mode = mode) && length(x) == 1L) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(mode == "any")
    err("`", x_name, "` must be a vector of length 1.")
  err("`", x_name, "` must be a vector of length 1 and mode '", mode, "'.")
}

#' @describeIn chk_true Check Vector
#' 
#' Checks if vector using:
#' 
#' \code{is.vector(x, mode = mode)}
#' 
#' \code{mode} should be a string.
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_vector <- function(x, mode = "any", err = TRUE) {
  if(is.vector(x, mode = mode)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(mode == "any")
    err("`", x_name, "` must be a vector.")
  err("`", x_name, "` must be a vector of mode '", mode, "'.")
}

#' @describeIn chk_true Check Atomic
#' 
#' Checks if atomic using:
#' 
#' \code{is.atomic(x)}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_atomic <- function(x, err = TRUE) {
  if(is.atomic(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be an atomic (vector, matrix or array) object.")
}

#' @describeIn chk_true Check Whole Numeric
#'  
#' Checks if integer vector or double equivalent using the equivalent of:
#' 
#' \code{is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x))))}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_numeric <- function(x, err = TRUE) {
  if(is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, 
      "` must be a whole numeric vector (integer vector or double equivalent).")
}

#' @describeIn chk_true Check Matches Regular Expression
#' 
#' Checks if all values match regular expression pattern using:
#'
#' \code{all(\link{grepl}(pattern, x))}
#' 
#' \code{pattern} should be a non-missing character scalar.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_grepl <- function (x, pattern = ".+", err = TRUE) {
  if(all(grepl(pattern, x))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1)
    err("`", x_name, "` must match regular expression '", pattern, "'.")
  err("All values of `", x_name, "` must match regular expression '", pattern, "'.")
}

#' @describeIn chk_true Check No Missing Values
#' 
#' Checks if no missing values using:
#' 
#' \code{!\link{anyNA}(x)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE) {
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must not have missing values.")
}

#' @describeIn chk_true Check Unique
#' 
#' Checks if unique using:
#' 
#' \code{!\link{anyDuplicated}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_unique
#' chk_unique(NA)
#' chk_unique(c(NA, NA), err = FALSE)
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unique <- function(x, err = TRUE) {
  if(!anyDuplicated(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be unique.")
}

#' @describeIn chk_true Check NULL
#' 
#' Checks if NULL using:
#' 
#' \code{\link{is.null}(x)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_null <- function(x, err = TRUE) {
  if(is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be NULL.")
}

#' @describeIn chk_true Check Not NULL
#' 
#' Checks if not NULL using:
#' 
#' \code{!\link{is.null}(x)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_not_null <- function(x, err = TRUE) {
  if(!is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must not be NULL.")
}

#' @describeIn chk_true Check Named
#' 
#' Checks if is named using:
#' 
#' \code{!is.null(\link{names}(x))}
#' 
#' @export
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE) {
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be named.")
}

#' @describeIn chk_true Check ... Unused
#' 
#' Checks if is ... unused using:
#' 
#' \code{!length(\link{list}(...))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unused <- function (..., err = TRUE) {
  if(!length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  err("`...` must be unused.")
}

#' @describeIn chk_true Check ... Used
#' 
#' Checks if is ... used using:
#' 
#' \code{length(\link{list}(...))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_used <- function (..., err = TRUE) {
  if(length(list(...))) return(TRUE)
  if(!err) return(FALSE)
  err("`...` must be used.")
}

#' @describeIn chk_true Check Function
#' 
#' Checks if is a function using:
#' 
#' \code{\link{is.function}(x)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_function <- function(x, err = TRUE) {
  if(is.function(x)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be a function.")
}

#' @describeIn chk_true Check Is
#' 
#' Checks if inherits from class using:
#' 
#' \code{\link{inherits}(x, class)}
#' 
#' Class should be a string.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must inherit from class '", class, "'.")
}

#' @describeIn chk_true Check Identical
#'
#' Checks if is identical to y using:
#' 
#' \code{\link{identical}(x, y)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_identical <- function (x, y, err = TRUE) {
  if(identical(x, y)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  err("`", x_name, "` not identical to: ", y, ".")
}

#' @describeIn chk_true Check Equal
#' 
#' Checks if is equal (identical within tolerance) to y using:
#'
#' \code{isTRUE(\link{all.equal}(x, y, tolerance))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE) {
  if(isTRUE(all.equal(x, y, tolerance))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  err("`", x_name, "` not equal to: ", y, ".")
}

#' @describeIn chk_true Check Equivalent
#' 
#' Checks if is equivalent (equal ignoring attributes) to y using:
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE) {
  if(isTRUE(all.equal(x, y, tolerance, check.attributes = FALSE))) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  err("`", x_name, "` not equivalent to: ", y, ".")
}

#' @describeIn chk_true Check Less Than
#' 
#' Checks if all non-missing values are less than value using:
#' 
#' \code{all(x[!is.na(x)] < value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lt <- function (x, value = 0, err = TRUE) {
  if(all(x[!is.na(x)] < value)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L)
    err("`", x_name, "` must be less than ", cc(value), ", not ", cc(x), ".")
  err("Values of `", x_name, "` must be less than ", cc(value), ".")
}

#' @describeIn chk_true Check Less Than or Equal To
#' 
#' Checks if all non-missing values are less than or equal to y using:
#' 
#' \code{all(x[!is.na(x)] <= value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lte <- function (x, value = 0, err = TRUE) {
  if(all(x[!is.na(x)] <= value)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L)
    err("`", x_name, "` must be less than or equal to ", cc(value), ", not ", cc(x), ".")
  err("Values of `", x_name, "` must be less than or equal to ", cc(value), ".")
}

#' @describeIn chk_true Check Greater Than
#' 
#' Checks if all non-missing values are greater than value using:
#' 
#' \code{all(x[!is.na(x)] > value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gt <- function (x, value = 0, err = TRUE) {
  if(all(x[!is.na(x)] > value)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L)
    err("`", x_name, "` must be greater than ", cc(value), ", not ", cc(x), ".")
  err("Values of `", x_name, "` must be greater than ", cc(value), ".")
}

#' @describeIn chk_true Check Greater Than or Equal To
#' 
#' Checks if all non-missing values are greater than or equal to y using:
#' 
#' \code{all(x[!is.na(x)] >= value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gte <- function (x, value = 0, err = TRUE) {
  if(all(x[!is.na(x)] >= value)) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L)
    err("`", x_name, "` must be greater than or equal to ", cc(value), 
        ", not ", cc(x), ".")
  err("Values of `", x_name, "` must be greater than or equal to ", cc(value), ".")
}

#' @describeIn chk_true Check Range
#' 
#' Checks if all non-missing values fall within range using:
#' 
#' \code{all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])}
#' 
#' Range should be a non-mising sorted vector of length 2.
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_range <- function (x, range = c(0, Inf), err = TRUE) {
  if(all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])) return(TRUE)
  if(!err) return(FALSE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L) {
    if(range[1] == range[2])
      err("`", x_name, "` must be ", cc(range[1]), ", not ", cc(x), ".")
    err("`", x_name, "` must be between ", cc(range, " and "), 
        ", not ", cc(x), ".")
  }
  if(range[1] == range[2])
    err("Values of `", x_name, "` must be ", cc(range[1]), ".")
  err("Values of `", x_name, "` must be between ", cc(range, " and "), ".")
}

#' @describeIn chk_true Check Match
#' 
#' Checks if all values match values using equivalent of:
#' 
#' \code{all(\link{match}(x, values, nomatch = 0) > 0)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_match <- function (x, values = c(0, Inf), err = TRUE) {
  if(all(x %in% values)) return(TRUE)
  if(!err) return(FALSE)
  values <- sort(unique(values), na.last = TRUE)
  x_name <- deparse(substitute(x))
  if(length(x) == 1L)
    err("`", x_name, "` must match ", cc(values, " or "), ", not ", cc(x), ".")
  err("Values of `", x_name, "` must match ", cc(values, " or "), ".")
}

#' @describeIn chk_true Check Directory Exists
#' 
#' Checks if directory exist using:
#' 
#' \code{length(x) == 1L && \link{dir.exists}(x))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dir <- function(x, err = TRUE) {
  if(length(x) == 1L && dir.exists(x)) return(TRUE)
  if(!err) return(FALSE)
  if(length(x) == 1L)
    err("Can't find directory '", x, "'.")
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be length 1, not ", length(x), ".")
}

#' @describeIn chk_true Check Directories Exist
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dirs <- function(x, err = TRUE) {
  if(all(dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find directory '", x, "'.")
  err("Can't find the following directories: ", cc(x, " or "), ".")
}

#' @describeIn chk_true Check File Exists
#' 
#' Checks if file exists using:
#' 
#' \code{length(x) == 1L & \link{file.exists}(x) && !dir.exists(x)}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE) {
  if(length(x) == 1L & all(file.exists(x) & !dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  if(length(x) == 1L)
    err("Can't find file '", x, "'.")
  x_name <- deparse(substitute(x))
  err("`", x_name, "` must be length 1, not ", length(x), ".")
}

#' @describeIn chk_true Check Files Exist
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#' 
#' @export
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_files <- function(x, err = TRUE) {
  if(all(file.exists(x) & !dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!file.exists(x) | dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find file '", x, "'.")
  err("Can't find the following files: ", cc(x, " or "), ".")
}
