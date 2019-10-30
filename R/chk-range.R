#' Check/Validate Range
#'
#' Checks/validates range of non-missing values.
#'
#' @inheritParams chk_flag
#' @param value A non-missing scalar of a value.
#' @param range A vector of length 2 of the lower and upper permitted values.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_range
NULL

#' @describeIn chk_range Check Range
#'
#' Checks if all non-missing values fall within range using
#' `vld_range()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_range
#' chk_range(0)
#' try(chk_range(-0.1))
chk_range <- function(x, range = c(0, 1), x_name = NULL) {
  if(vld_range(x, range)) {
    return(invisible())
  }

  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    if(range[1] == range[2]) {
      abort_chk(x_name, " must be ", cc(range[1]), ", not ", cc(x))
    }
    abort_chk(
      x_name, " must be between ", cc(range, " and "),
      ", not ", cc(x)
    )
  }
  if(range[1] == range[2]) {
    abort_chk(x_name, " must have values of ", cc(range[1]))
  }
  abort_chk(x_name, " must have values between ", cc(range, " and "))
}

#' @describeIn chk_range Validate Range
#'
#' Validates all non-missing values fall within range using
#'
#' `all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])`
#'
#' Range should be a non-missing sorted vector of length 2.
#'
#' @export
#'
#' @examples
#'
#' # vld_range
#' vld_range(numeric(0))
#' vld_range(0)
#' vld_range(-0.1)
#' vld_range(c(0.1, 0.2, NA))
#' vld_range(c(0.1, 0.2, NA), range = c(0, 1))
vld_range <- function(x, range = c(0, 1)) {
  all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])
}


#' @describeIn chk_range Check Less Than
#'
#' Checks if all non-missing values are less than value using
#' `vld_lt()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_lt
#' chk_lt(-0.1)
#' try(chk_lt(c(-0.1, 0.2)))
chk_lt <- function(x, value = 0, x_name = NULL) {
  if(vld_lt(x, value)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(x_name, " must be less than ", cc(value), ", not ", cc(x))
  }
  abort_chk(x_name, " must have values less than ", cc(value))
}

#' @describeIn chk_range Validate Less Than
#'
#' Validates all non-missing values are less than value using
#'
#' `all(x[!is.na(x)] < value))`
#'
#' `value` should be a non-missing scalar.
#'
#' @export
#'
#' @examples
#'
#' # vld_lt
#' vld_lt(numeric(0))
#' vld_lt(0)
#' vld_lt(-0.1)
#' vld_lt(c(-0.1, -0.2, NA))
#' vld_lt(c(-0.1, 0.2))
#' vld_lt(c(-0.1, 0.2), value = 1)
#' vld_lt("a", value = "b")
vld_lt <- function(x, value = 0) all(x[!is.na(x)] < value)

#' @describeIn chk_range Check Less Than or Equal To
#'
#' Checks if all non-missing values are less than or equal to y using
#' `vld_lte()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_lte
#' chk_lte(0)
#' try(chk_lte(0.1))
chk_lte <- function(x, value = 0, x_name = NULL) {
  if(vld_lte(x, value)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(
      x_name, " must be less than or equal to ", cc(value), ", not ", cc(x),
      ""
    )
  }
  abort_chk(x_name, " must have values less than or equal to ", cc(value))
}

#' @describeIn chk_range Validate Less Than or Equal To
#'
#' Validates all non-missing values are less than or equal to y using
#'
#' `all(x[!is.na(x)] <= value))`
#'
#' `value` should be a non-missing scalar.
#'
#' @export
#'
#' @examples
#'
#' # vld_lte
#' vld_lte(numeric(0))
#' vld_lte(0)
#' vld_lte(0.1)
#' vld_lte(c(-0.1, -0.2, NA))
#' vld_lte(c(-0.1, -0.2, NA), value = -1)
vld_lte <- function(x, value = 0) all(x[!is.na(x)] <= value)

#' @describeIn chk_range Check Greater Than
#'
#' Checks if all non-missing values are greater than value using
#' `vld_gt()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_gt
#' chk_gt(0.1)
#' try(chk_gt(c(0.1, -0.2)))
chk_gt <- function(x, value = 0, x_name = NULL) {
  if(vld_gt(x, value)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(x_name, " must be greater than ", cc(value), ", not ", cc(x))
  }
  abort_chk(x_name, " must have values greater than ", cc(value))
}

#' @describeIn chk_range Validate Greater Than
#'
#' Validates all non-missing values are greater than value using
#'
#' `all(x[!is.na(x)] > value))`.
#'
#' `value` should be a non-missing scalar.
#'
#' @export
#'
#' @examples
#'
#' # vld_gt
#' vld_gt(numeric(0))
#' vld_gt(0)
#' vld_gt(0.1)
#' vld_gt(c(0.1, 0.2, NA))
#' vld_gt(c(0.1, -0.2))
#' vld_gt(c(-0.1, 0.2), value = -1)
#' vld_gt("b", value = "a")
vld_gt <- function(x, value = 0) all(x[!is.na(x)] > value)

#' @describeIn chk_range Check Greater Than or Equal To
#'
#' Checks if all non-missing values are greater than or equal to y using
#' `vld_gte()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_gte
#' chk_gte(0)
#' try(chk_gte(-0.1))
chk_gte <- function(x, value = 0, x_name = NULL) {
  if(vld_gte(x, value)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(
      x_name, " must be greater than or equal to ", cc(value),
      ", not ", cc(x)
    )
  }
  abort_chk(x_name, " must have values greater than or equal to ", cc(value))
}

#' @describeIn chk_range Validate Greater Than or Equal To
#'
#' Validates all non-missing values are greater than or equal to y using:
#'
#' `all(x[!is.na(x)] >= value))`.
#'
#' `value` should be a non-missing scalar.
#'
#' @export
#'
#' @examples
#'
#' # vld_gte
#' vld_gte(numeric(0))
#' vld_gte(0)
#' vld_gte(-0.1)
#' vld_gte(c(0.1, 0.2, NA))
#' vld_gte(c(0.1, 0.2, NA), value = 1)
vld_gte <- function(x, value = 0) all(x[!is.na(x)] >= value)
