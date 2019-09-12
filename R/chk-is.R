#' Check/Validate Is
#'
#' Checks if is a particular type of object.
#'
#' @inheritParams chk_true
#' @param class A string specifying the class.
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_is
NULL

#' @describeIn chk_is Check Is
#'
#' Checks if inherits from class using \code{vld_is()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_is
#' chk_is(1, "numeric")
#' try(chk_is(1, "character"))
chk_is <- function(x, class, x_name = NULL) {
  if (vld_is(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must inherit from class '", class, "'.")
}

#' @describeIn chk_is Validate Is
#'
#' Validates inherits from class using
#'
#' \code{\link{inherits}(x, class)}
#'
#' Class should be a string.
#'
#' @export
#'
#' @examples
#'
#' # vld_is
#' vld_is(numeric(0), "numeric")
#' vld_is(1, "numeric")
#' vld_is(NA_real_, "numeric")
#' vld_is(1, "character")
#' vld_is(NULL, "numeric")
vld_is <- function(x, class) inherits(x, class)

#' @describeIn chk_is Check Whole Numeric
#'
#' Checks if integer vector or double equivalent using \code{vld_whole_numeric()}.
#'
#' The \code{\link{chk_whole_number}()} function checks if
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
  if (vld_whole_numeric(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(
    x_name,
    " must be a whole numeric vector (integer vector or double equivalent)."
  )
}

#' @describeIn chk_is Validate Whole Numeric
#'
#' Validates integer vector or double equivalent using
#'
#' \code{is.integer(x) || (is.double(x) && vld_true(all.equal(x, as.integer(x))))}
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

#' @describeIn chk_is Check List
#'
#' Checks if is a list using
#' \code{vld_list()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_list
#' chk_list(list())
#' try(chk_list(1))
chk_list <- function(x, x_name = NULL) {
  if (vld_list(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be a list.")
}

#' @describeIn chk_is Validate List
#'
#' Validates is a list using
#'
#' \code{\link{is.list}(x)}
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

#' @describeIn chk_is Check Function
#'
#' Checks if is a function using \code{vld_function()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_function
#' chk_function(mean)
#' try(chk_function(1))
chk_function <- function(x, x_name = NULL) {
  if (vld_function(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be a function.")
}

#' @describeIn chk_is Validate Function
#'
#' Validates is a function using:
#'
#' \code{\link{is.function}(x)}
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
vld_function <- function(x) is.function(x)
