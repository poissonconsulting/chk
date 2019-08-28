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
#' @param x_name A string of the name of object x or NULL.
#' @param length A count of the length.
#' @param class A string specifying the class.
#' @param incomparables A vector of values that cannot be compared.
#' FALSE means that all values can be compared.
#' @param y An object to check against.
#' @param tolerance A non-negative numeric scalar.
#' @param values A vector of the permitted values.
#' @param value A non-missing scalar of a value.
#' @param range A vector of length 2 of the lower and upper permitted values.
#' @param regexp A string of a regular expression.
#' @param chk_fun A chk function.
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
#' try(chk_true(1))
#' try(chk_true(NA))
#' try(chk_true(FALSE))
#' chk_true(TRUE)
#' try(chk_true(c(TRUE, TRUE)))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_true <- function(x, err = TRUE, x_name = NULL){
  if(isTRUE(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be TRUE.")
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
#' try(chk_false(0))
#' try(chk_false(NA))
#' try(chk_false(TRUE))
#' chk_false(FALSE)
#' try(chk_false(c(FALSE, FALSE)))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_false <- function(x, err = TRUE, x_name = NULL){
  if(isFALSE(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be FALSE.")
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
#' try(chk_flag(1))
#' try(chk_flag(NA))
#' chk_flag(TRUE)
#' chk_flag(FALSE)
#' try(chk_flag(c(TRUE, TRUE)))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_flag <- function(x, err = TRUE, x_name = NULL){
  if(is.logical(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a flag (TRUE or FALSE).")
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
#' try(chk_lgl(1))
#' chk_lgl(NA)
#' chk_lgl(TRUE)
#' chk_lgl(FALSE)
#' try(chk_lgl(c(TRUE, TRUE)))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lgl <- function(x, err = TRUE, x_name = NULL){
  if(is.logical(x) && length(x) == 1L) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a logical scalar (TRUE, FALSE or NA).")
}

#' @describeIn chk_true Check Number
#' 
#' Checks if non-missing numeric scalar using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_number
#' try(chk_number(TRUE))
#' chk_number(1.1)
#' chk_number(1L)
#' try(chk_number(NA_real_))
#' try(chk_number(c(1.1, 1.1)))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_number <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a number (non-missing numeric scalar).")
}

#' @describeIn chk_true Check Proportion
#' 
#' Checks if non-missing numeric scalar between 0 and 1 using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_proportion
#' try(chk_proportion(1.1))
#' chk_proportion(0.5)
#' chk_proportion(1L)
#' try(chk_proportion(NA_real_))
#' try(chk_proportion(c(0.5, 0.5)))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_proportion <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) 
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, 
      " must be a proportion (non-missing numeric scalar between 0 and 1).")
}

#' @describeIn chk_true Check Whole Number
#'  
#' Checks if non-missing integer scalar or double equivalent using:
#' 
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && 
#'   (is.integer(x) || isTRUE(all.equal(x, as.integer(x))))}
#'   
#' @export
#' 
#' @examples 
#' 
#' # chk_whole_number
#' try(chk_whole_number(1.1))
#' chk_whole_number(2)
#' chk_whole_number(2L)
#' try(chk_whole_number(NA_integer_))
#' try(chk_whole_number(c(2L, 2L)))
#'   
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_number <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, 
      " must be a whole number (non-missing integer scalar or double equivalent).")
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
#' @examples 
#' 
#' # chk_count
#' try(chk_count(-1))
#' chk_count(0)
#' chk_count(1L)
#' try(chk_count(NA_integer_))
#' try(chk_count(c(2L, 2L)))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_count <- function(x, err = TRUE, x_name = NULL){
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && 
     (is.integer(x) || isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, 
      " must be a count (non-missing non-negative integer scalar or double equivalent).")
}

#' @describeIn chk_true Check String
#' 
#' Checks if non-missing character scalar using:
#' 
#' \code{is.character(x) && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_string
#' try(chk_string(1))
#' chk_string("1")
#' chk_string("")
#' try(chk_string(NA_character_))
#' try(chk_string(c("1", "1")))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_string <- function(x, err = TRUE, x_name = NULL){
  if(is.character(x) && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a string (non-missing character scalar).")
}

#' @describeIn chk_true Check String
#' 
#' Checks if non-missing Date scalar using:
#' 
#' \code{inherits(x, "Date") && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_date
#' try(chk_date(1))
#' try(chk_date("2001-01-02"))
#' chk_date(as.Date("2001-01-02"))
#' chk_date(Sys.Date())
#' try(chk_date(Sys.time()))
#' try(chk_date(c(Sys.Date(), Sys.Date())))
#'   
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_date <- function(x, err = TRUE, x_name = NULL){
  if(inherits(x, "Date") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a date (non-missing Date scalar).")
}

#' @describeIn chk_true Check DateTime
#' 
#' Checks if non-missing POSIXct scalar using:
#' 
#' \code{inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_datetime
#' try(chk_datetime(1))
#' try(chk_datetime("2001-01-02"))
#' chk_datetime(as.POSIXct("2001-01-02"))
#' try(chk_datetime(Sys.Date()))
#' chk_datetime(Sys.time())
#' try(chk_datetime(c(Sys.time(), Sys.time())))
#'    
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_datetime <- function(x, err = TRUE, x_name = NULL){
  if(inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a datetime (non-missing POSIXct scalar).")
}

#' @describeIn chk_true Check Length
#' 
#' Checks if is length length using:
#' 
#' \code{length(x) == length}
#' 
#' \code{length} should be a count.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_length
#' try(chk_length(numeric(0)))
#' try(chk_length(1:2))
#' chk_length(1)
#' chk_length(NA_character_)
#' chk_length(Sys.Date())
#' chk_length(Sys.time())
#' chk_length(1:2, length = 2)
#'   
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_length <- function(x, length = 1L, err = TRUE, x_name = NULL) {
  if(length(x) == length) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be length ", length, ", not ", length(x), ".")
}

#' @describeIn chk_true Check Whole Numeric
#'  
#' Checks if integer vector or double equivalent using the equivalent of:
#' 
#' \code{is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x))))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_whole_numeric
#' try(chk_whole_numeric(TRUE))
#' try(chk_whole_numeric(1.5))
#' chk_whole_numeric(1)
#' chk_whole_numeric(NA_real_)
#' chk_whole_numeric(1:2)
#' chk_whole_numeric(double(0))
#'    
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_whole_numeric <- function(x, err = TRUE, x_name = NULL){
  if(is.integer(x) || (is.double(x) && isTRUE(all.equal(x, as.integer(x)))))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, 
      " must be a whole numeric vector (integer vector or double equivalent).")
}

#' @describeIn chk_true Check No Missing Values
#' 
#' Checks if no missing values using:
#' 
#' \code{!\link{anyNA}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_no_missing
#' try(chk_no_missing(NA))
#' try(chk_no_missing(c(1, NA)))
#' chk_no_missing(character(0))
#' chk_no_missing(1)
#' chk_no_missing(1:10)
#'   
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_no_missing <- function(x, err = TRUE, x_name = NULL){
  if(!anyNA(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must not have missing values.")
}

#' @describeIn chk_true Check Unique
#' 
#' Checks if unique using:
#' 
#' \code{!\link{anyDuplicated}(x, incomparables = incomparables)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_unique
#' chk_unique(NULL)
#' chk_unique(numeric(0))
#' chk_unique(c(NA, 2))
#' try(chk_unique(c(NA, NA, 2)))
#' chk_unique(c(NA, NA, 2), incomparables = NA)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_unique <- function(x, incomparables = FALSE, err = TRUE, x_name = NULL){
  if(!anyDuplicated(x, incomparables = incomparables)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be unique.")
}

#' @describeIn chk_true Check NULL
#' 
#' Checks if NULL using:
#' 
#' \code{\link{is.null}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_null
#' try(chk_null(1))
#' chk_null(NULL)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_null <- function(x, err = TRUE, x_name = NULL){
  if(is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be NULL.")
}

#' @describeIn chk_true Check Not NULL
#' 
#' Checks if not NULL using:
#' 
#' \code{!\link{is.null}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_not_null
#' try(chk_not_null(NULL))
#' chk_not_null(1)
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_not_null <- function(x, err = TRUE, x_name = NULL){
  if(!is.null(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must not be NULL.")
}

#' @describeIn chk_true Check Named
#' 
#' Checks if is named using:
#' 
#' \code{!is.null(\link{names}(x))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_named
#' try(chk_named(1))
#' try(chk_named(list(1)))
#' chk_named(c(x = 1))
#' chk_named(list(x = 1))
#' chk_named(c(x = 1)[-1])
#' chk_named(list(x = 1)[-1])
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_named <- function(x, err = TRUE, x_name = NULL){
  if(!is.null(names(x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be named.")
}

#' @describeIn chk_true Check ... Unused
#' 
#' Checks if is ... unused using:
#' 
#' \code{!length(\link{list}(...))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_unused
#' fun <- function(x, ...) { chk_unused(...); x }
#' fun(1)
#' try(fun(1,2))
#'  
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
#' 
#' @examples 
#' 
#' # chk_used
#' fun <- function(x, ...) { chk_used(...); x }
#' try(fun(1))
#' fun(1,2)
#' 
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
#' 
#' @examples 
#' 
#' # chk_function
#' try(chk_function(1))
#' try(chk_function(list(1)))
#' chk_function(mean)
#' chk_function(function(x) x)
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_function <- function(x, err = TRUE, x_name = NULL){
  if(is.function(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a function.")
}

#' @describeIn chk_true Check List
#' 
#' Checks if is a list using:
#' 
#' \code{\link{is.list}(x)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_list
#' try(chk_list(1))
#' try(chk_list(NULL))
#' chk_list(list())
#' chk_list(list(x = 1))
#' chk_list(mtcars)
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_list <- function(x, err = TRUE, x_name = NULL){
  if(is.list(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a list.")
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
#' 
#' @examples 
#' 
#' # chk_is
#' try(chk_is(1, "character"))
#' try(chk_is(NULL, "numeric"))
#' chk_is(numeric(0), "numeric")
#' chk_is(1, "numeric")
#' chk_is(NA_real_, "numeric")
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_is <- function(x, class, err = TRUE, x_name = NULL) {
  if(inherits(x, class)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must inherit from class '", class, "'.")
}

#' @describeIn chk_true Check Identical
#'
#' Checks if is identical to y using:
#' 
#' \code{\link{identical}(x, y)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_identical
#' try(chk_identical(1, 1L))
#' chk_identical(1, 1)
#' try(chk_identical(1, c(1,1)))
#' chk_identical(c(1,1), c(1,1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_identical <- function (x, y, err = TRUE, x_name = NULL) {
  if(identical(x, y)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be identical to: ", y, ".")
}

#' @describeIn chk_true Check Equal
#' 
#' Checks if is equal (identical within tolerance) to y using:
#'
#' \code{isTRUE(\link{all.equal}(x, y, tolerance))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_equal
#' try(chk_equal(1, 1.0000001))
#' chk_equal(1, 1.00000001)
#' chk_equal(1, 1L)
#' try(chk_equal(c(x = 1), c(y = 1L)))
#' chk_equal(c(x = 1), c(x = 1L))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equal <- function (x, y, tolerance = sqrt(.Machine$double.eps), err = TRUE,
                       x_name = NULL) {
  if(isTRUE(all.equal(x, y, tolerance))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be equal to: ", y, ".")
}

#' @describeIn chk_true Check Equivalent
#' 
#' Checks if is equivalent (equal ignoring attributes) to y using:
#'
#' \code{\link{isTRUE}(\link{all.equal}(x, y, tolerance, check.attributes = FALSE))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_equivalent
#' try(chk_equivalent(1, 1.0000001))
#' chk_equivalent(1, 1.00000001)
#' chk_equivalent(1, 1L)
#' chk_equivalent(c(x = 1), c(y = 1L))
#' chk_equivalent(c(x = 1), c(x = 1L))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_equivalent <- function (x, y, tolerance = sqrt(.Machine$double.eps), 
                            err = TRUE, x_name = NULL) {
  if(isTRUE(all.equal(x, y, tolerance, check.attributes = FALSE))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  y <- utils::capture.output(dput(y, control = "all"))
  err(x_name, " must be equivalent to: ", y, ".")
}
#' @describeIn chk_true Check All Identical
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

  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must have identical elements.")
}

#' @describeIn chk_true Check All
#' 
#' Checks all elements using:
#' 
#' \code{all(vapply(x, chk_fun, TRUE, ...))}
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
    if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
    return(chk_fun(x, ..., err = err, x_name = x_name))
  }
  args <- list(...)
  args$X <- x
  args$FUN <- chk_fun
  args$FUN.VALUE <- TRUE
  args$err <- FALSE
  
  if(all(do.call("vapply", args))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  x_name <- p0("All elements of ", x_name)
  args$err <- TRUE
  args$x_name <- x_name
  do.call("vapply", args)
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
#' 
#' @examples 
#' 
#' # chk_lt
#' chk_lt(numeric(0))
#' try(chk_lt(0))
#' chk_lt(-0.1)
#' chk_lt(c(-0.1, -0.2, NA))
#' try(chk_lt(c(-0.1, 0.2)))
#' chk_lt(c(-0.1, 0.2), value = 1)
#' chk_lt("a", value = "b")
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lt <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] < value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be less than ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values less than ", cc(value), ".")
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
#' 
#' @examples 
#' 
#' # chk_lte
#' chk_lte(numeric(0))
#' chk_lte(0)
#' try(chk_lte(0.1))
#' chk_lte(c(-0.1, -0.2, NA))
#' try(chk_lte(c(-0.1, -0.2, NA), value = -1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lte <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] <= value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be less than or equal to ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values less than or equal to ", cc(value), ".")
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
#' 
#' @examples 
#' 
#' # chk_gt
#' chk_gt(numeric(0))
#' try(chk_gt(0))
#' chk_gt(0.1)
#' chk_gt(c(0.1, 0.2, NA))
#' try(chk_gt(c(0.1, -0.2)))
#' chk_gt(c(-0.1, 0.2), value = -1)
#' chk_gt("b", value = "a")
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gt <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] > value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be greater than ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values greater than ", cc(value), ".")
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
#' 
#' @examples 
#' 
#' # chk_gte
#' chk_gte(numeric(0))
#' chk_gte(0)
#' try(chk_gte(-0.1))
#' chk_gte(c(0.1, 0.2, NA))
#' try(chk_gte(c(0.1, 0.2, NA), value = 1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gte <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] >= value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be greater than or equal to ", cc(value), 
        ", not ", cc(x), ".")
  err(x_name, " must have values greater than or equal to ", cc(value), ".")
}

#' @describeIn chk_true Check Range
#' 
#' Checks if all non-missing values fall within range using:
#' 
#' \code{all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])}
#' 
#' Range should be a non-missing sorted vector of length 2.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_range
#' chk_range(numeric(0))
#' chk_range(0)
#' try(chk_range(-0.1))
#' chk_range(c(0.1, 0.2, NA))
#' chk_range(c(0.1, 0.2, NA), range = c(0,1))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_range <- function (x, range = c(0, Inf), err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L) {
    if(range[1] == range[2])
      err(x_name, " must be ", cc(range[1]), ", not ", cc(x), ".")
    err(x_name, " must be between ", cc(range, " and "), 
        ", not ", cc(x), ".")
  }
  if(range[1] == range[2])
    err(x_name, " must have values of ", cc(range[1]), ".")
  err(x_name, " must have values between ", cc(range, " and "), ".")
}

#' @describeIn chk_true Check In
#' 
#' Checks if all values in values using equivalent of:
#' 
#' \code{all(\link{match}(x, values, nomatch = 0) > 0)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_in
#' chk_in(numeric(0), 1:10)
#' chk_in(1, 1:10)
#' try(chk_in(11, 1:10))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_in <- function (x, values = c(0, 1, NA), err = TRUE, x_name = NULL) {
  if(all(x %in% values)) return(TRUE)
  if(!err) return(FALSE)
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must match ", cc(values, " or "), ", not ", cc(x), ".")
  err(x_name, " must have values matching ", cc(values, " or "), ".")
}

#' @describeIn chk_true Check Matches
#' 
#' Checks if all values match regular expression using:
#'
#' \code{all(\link{grepl}(regexp, x))}
#' 
#' \code{regexp} should be a non-missing character scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_match
#' try(chk_match(""))
#' chk_match("1")
#' try(chk_match("1", regexp = "2"))
#' try(chk_match(NA_character_, regexp = ".*"))
#' chk_match(c("a"), regexp = ".*")
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_match <- function (x, regexp = ".+", err = TRUE, x_name = NULL) {
  if(all(grepl(regexp, x))) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- p0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must match regular expression '", regexp, "'.")
    err(x_name, " must have values matching regular expression '", regexp, "'.")
}

#' @describeIn chk_true Check Directories Exist
#' 
#' Checks if directories exist using:
#' 
#' \code{all(\link{dir.exists}(x))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_dir
#' try(chk_dir(tempfile()))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_dir <- function(x, err = TRUE){
  if(all(dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find directory '", x, "'.")
  err("Can't find the following directories: ", cc(x, " or "), ".")
}

#' @describeIn chk_true Check Files Exist
#' 
#' Checks if files exist using:
#' 
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_file
#' try(chk_file(tempfile()))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_file <- function(x, err = TRUE){
  if(all(file.exists(x) & !dir.exists(x))) return(TRUE)
  if(!err) return(FALSE)
  x <- unique(x)
  x <- x[!file.exists(x) | dir.exists(x)]
  if(length(x) == 1L)
    err("Can't find file '", x, "'.")
  err("Can't find the following files: ", cc(x, " or "), ".")
}
