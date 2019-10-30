#' Check Type
#'
#' Checks if is a particular type of object.
#'
#' @inheritParams chk_flag
#' @param class A string specifying the class.
#' @param formals A count of the number of formal arguments.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_type
NULL

#' @describeIn chk_type Check Inherits from S3 Class
#'
#' Checks inherits from S3 class using `vld_s3_class()`.
#'
#' Class should be a string.
#'
#' @export
#'
#' @examples
#'
#' # chk_s3_class
#' chk_s3_class(1, "numeric")
#' try(chk_s3_class(getClass("MethodDefinition"), "classRepresentation"))
chk_s3_class <- function(x, class, x_name = NULL) {
  if(vld_s3_class(x, class)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from S3 class '", class, "'")
}

#' @describeIn chk_type Validate Inherits from S3 Class
#'
#' Validates inherits from S3 class using

#'
#' `!isS4(x) && inherits(x, class)`
#'
#' Class should be a string.
#'
#' @seealso [isS4()]
#' @seealso [inherits()]
#'
#' @export
#'
#' @examples
#'
#' # vld_s3_class
#' vld_s3_class(numeric(0), "numeric")
#' vld_s3_class(getClass("MethodDefinition"), "classRepresentation")
vld_s3_class <- function(x, class) !isS4(x) && inherits(x, class)

#' @describeIn chk_type Check Inherits from S4 Class
#'
#' Checks inherits from S4 class using `vld_s4_class()`.
#'
#' Class should be a string.
#'
#' @seealso [isS4()]
#' @seealso [inherits()]
#'
#' @export
#'
#' @examples
#'
#' # chk_s4_class
#' try(chk_s4_class(1, "numeric"))
#' chk_s4_class(getClass("MethodDefinition"), "classRepresentation")
chk_s4_class <- function(x, class, x_name = NULL) {
  if(vld_s4_class(x, class)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from S4 class '", class, "'")
}

#' @describeIn chk_type Validate Inherits from S4 Class
#'
#' Validates inherits from S4 class using
#'
#' `isS4(x) && methods::is(x, class)`
#'
#' Class should be a string.
#'
#' @export
#'
#' @seealso [methods::is()]
#'
#' @examples
#'
#' # vld_s4_class
#' vld_s4_class(numeric(0), "numeric")
#' vld_s4_class(getClass("MethodDefinition"), "classRepresentation")
vld_s4_class <- function(x, class) isS4(x) && methods::is(x, class)

#' @describeIn chk_type Check Whole Numeric
#'
#' Checks if integer vector or double equivalent using `vld_whole_numeric()`.
#'
#' The [chk_whole_number()] function checks if
#' non-missing integer scalar or double equivalent.
#'
#' @export
#'
#' @examples
#'
#' # chk_whole_numeric
#' chk_whole_numeric(1)
#' try(chk_whole_numeric(1.1))
chk_whole_numeric <- function(x, x_name = NULL) {
  if(vld_whole_numeric(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a whole numeric vector (integer vector or double equivalent)"
  )
}

#' @describeIn chk_type Validate Whole Numeric
#'
#' Validates integer vector or double equivalent using
#'
#' `is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))`
#'
#' @export
#'
#' @examples
#'
#' # vld_whole_numeric
#' vld_whole_numeric(1)
#' vld_whole_numeric(NA_real_)
#' vld_whole_numeric(1:2)
#' vld_whole_numeric(double(0))
#' vld_whole_numeric(TRUE)
#' vld_whole_numeric(1.5)
vld_whole_numeric <- function(x) {
  is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))
}

#' @describeIn chk_type Check List
#'
#' Checks if is a list using
#' `vld_list()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_list
#' chk_list(list())
#' try(chk_list(1))
chk_list <- function(x, x_name = NULL) {
  if(vld_list(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a list")
}

#' @describeIn chk_type Validate List
#'
#' Validates is a list using
#'
#' `is.list(x)`
#'
#' @seealso [is.list()]
#'
#' @export
#'
#' @examples
#'
#' # vld_list
#' vld_list(list())
#' vld_list(list(x = 1))
#' vld_list(mtcars)
#' vld_list(1)
#' vld_list(NULL)
vld_list <- function(x) is.list(x)

#' @describeIn chk_type Check Function
#'
#' Checks if is a function using `vld_function()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_function
#' chk_function(mean)
#' try(chk_function(1))
chk_function <- function(x, formals = NULL, x_name = NULL) {
  if(vld_function(x, formals)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(!is.function(x)) abort_chk(x_name, " must be a function")
  abort_chk(x_name, " must have ", formals, " formal arguments (not ", length(formals(x)), ")")
}

#' @describeIn chk_type Validate Function
#'
#' Validates is a function using:
#'
#' `is.function(x) && (is.null(formals) || length(formals(x)) == formals)`
#'
#' @seealso [is.function()]
#' @seealso [formals()]
#'
#' @export
#'
#' @examples
#'
#' # vld_function
#' vld_function(mean)
#' vld_function(function(x) x)
#' vld_function(1)
#' vld_function(list(1))
vld_function <- function(x, formals = NULL) {
  is.function(x) && (is.null(formals) || length(formals(x)) == formals)
}

#' @describeIn chk_type Check Vector
#'
#' Checks if is a vector using `is.vector()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_vector
#' chk_vector(1)
#' chk_vector(list())
#' try(chk_vector(matrix(1)))
chk_vector <- function(x, x_name = NULL) {
  if(vld_vector(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a vector")
}

#' @describeIn chk_type Validate Vector
#'
#' Validates is a vector using:
#'
#' `is.vector(x)`
#'
#' @seealso [is.vector()]
#'
#' @export
#'
#' @examples
#'
#' # vld_vector
#' vld_vector(1)
vld_vector <- function(x) is.vector(x)

#' @describeIn chk_type Check Scalar
#'
#' Checks if is a vector using `length(x) == 1L`.
#'
#' @export
#'
#' @examples
#'
#' # chk_scalar
#' chk_scalar(1)
#' chk_scalar(list(1))
#' try(chk_scalar(1:2))
chk_scalar <- function(x, x_name = NULL) {
  if(vld_scalar(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a scalar (length 1)")
}

#' @describeIn chk_type Validate Scalar
#'
#' Validates is `length(x) == 1L`.
#'
#' @export
#'
#' @examples
#'
#' # vld_scalar
#' vld_scalar(1)
vld_scalar <- function(x) length(x) == 1L
