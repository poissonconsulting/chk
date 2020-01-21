#' Deprecated functions
#'
#'
#' Deprecated `chk_()` functions.
#'
#' @inheritParams chk_flag
#' @keywords internal
#' @name chk_deprecated
NULL

#' @describeIn chk_deprecated Check Directories Exist
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with \code{\link{chk_all}(x, \link{chk_dir})}.
#'
#' @export
chk_dirs <- function(x) {
  deprecate_soft("0.2.0", 
                 what = "chk_dirs()", 
                 details = "Please use `chk_all(x, chk_dir)` instead")
  chk_all(x, chk_dir)
}

#' @describeIn chk_deprecated Check Files Exist
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with \code{\link{chk_all}(x, \link{chk_file})}
#'
#' @export
chk_files <- function(x) {
  deprecate_soft("0.2.0", 
                 what = "chk_files()", 
                 details = "Please use `chk_all(x, chk_file)` instead")
  chk_all(x, chk_file)
}

#' @describeIn chk_deprecated Check Length
#'
#' \lifecycle{deprecated}
#'
#' `length` should be a count.
#'
#' Replace by \code{\link{chk_range}(length(x))} 
#'
#' @param length A count of the length.
#'
#' @export
chk_length <- function(x, length = 1L, x_name = NULL) {
  deprecate_soft("0.2.0", 
                 what = "chk_length()", 
                 with = "chk_range()")
  if(length(x) == length) {
    return(TRUE)
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be length ", length, ", not ", length(x))
}


#' @describeIn chk_deprecated Check Count
#'
#' \lifecycle{deprecated}
#'
#' Replace by \code{\link{chk_whole_number}(x); \link{chk_gte}(x)} 
#'
#' @export
chk_count <- function(x, x_name = NULL) {
  deprecate_warn("0.2.0", 
                 what = "chk_count()", 
                 details = "Please use `chk_whole_number()` and `chk_gte()` instead")
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_whole_number(x)
  chk_gte(x)
}

#' @describeIn chk_deprecated Check Proportion
#'
#' \lifecycle{deprecated}
#'
#' Checks if non-missing numeric scalar between 0 and 1 using:
#'
#' `is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1`
#'
#' Replace by [chk_number()] and [chk_range()].
#'
#' @export
chk_proportion <- function(x, x_name = NULL) {
  
  deprecate_soft("0.2.0", 
                 what = "chk_proportion()", 
                 details = "Please use `chk_number(x)` or `chk_range(x)` instead")
  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) {
    return(TRUE)
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a proportion (non-missing numeric scalar between 0 and 1)"
  )
}

#' @describeIn chk_deprecated Check In
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by \code{\link{chk_subset}(x, values, x_name=x_name)}
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_subset(x, values, x_name = x_name)
  deprecate_soft("0.2.0",
                 what = "chk_in()",
                 with = "chk_subset()"
  )
  invisible()
}

#' @describeIn chk_deprecated Check Has
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by \code{\link{chk_superset}(x, values, x_name = x_name)}
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_superset(x, values, x_name = x_name)
  deprecate_soft("0.2.0",
                 what = "chk_has()",
                 with = "chk_superset()"
  )
  invisible()
}


#' @describeIn chk_deprecated Check Is
#'
#' \lifecycle{soft-deprecated}
#'
#' Checks if inherits from class using `vld_is()`.
#'
#' Replace by [chk_s3_class()] or [chk_s4_class()].
#'
#' @export
#'
#' @examples
#'
#' # chk_is
#' chk_is(1, "numeric")
#' try(chk_is(1, "character"))
chk_is <- function(x, class, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk_is()", 
    with = "chk_s3_class()",
    id = "chk_is"
  )
  if(vld_is(x, class)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from class '", class, "'")
}

#' @describeIn chk_deprecated Validate Is
#'
#' \lifecycle{soft-deprecated}
#'
#' Validates inherits from class using
#'
#' `inherits(x, class)`
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
vld_is <- function(x, class) {
  deprecate_soft("0.2.0",
    what = "vld_is()", 
    with = "vld_class_s3()",
    id = "chk_is"
  )
  inherits(x, class)
}

#' @describeIn chk_deprecated Check No Missing Values
#' 
#' \lifecycle{soft-deprecated}
#'
#' Checks if no missing values using
#' `vld_no_missing()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_no_missing
#' chk_no_missing(1)
#' try(chk_no_missing(c(1, NA)))
chk_no_missing <- function(x, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk_no_missing()", with = "chk_not_any_na()",
    id = "chk_no_missing"
  )
  if(vld_no_missing(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must not have missing values")
}

#' @describeIn chk_deprecated Validate No Missing Values
#' 
#' \lifecycle{soft-deprecated}
#'
#' Validates no missing values using
#'
#' `!anyNA(x)`.
#'
#' @seealso [anyNA()]
#'
#' @export
#'
#' @examples
#'
#' # vld_no_missing
#' vld_no_missing(character(0))
#' vld_no_missing(1)
#' vld_no_missing(1:10)
#' vld_no_missing(NA)
#' vld_no_missing(c(1, NA))
vld_no_missing <- function(x) {
  deprecate_soft("0.2.0",
    what = "vld_no_missing()", with = "vld_not_any_na()",
    id = "chk_no_missing"
  )
  !anyNA(x)
}

#' @describeIn deparse_backtick_chk Deparse Backtick
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
deparse_backtick <- function(x) {
  deprecate_soft("0.2.0", 
                 what = "deparse_backtick()", 
                 with = "deparse_backtick_chk()")
  deparse_backtick_chk(x)
}


#' @describeIn chk_deprecated Turns checking on
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
chk_on <- function() {
  deprecate_warn("0.2.0", 
                 what = "chk_on()",
                 details = "This approach is no longer recommended")
  options(chk.on = TRUE)
}

#' @describeIn chk_deprecated Turns checking off
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
chk_off <- function() {
  deprecate_warn("0.2.0", 
                 what = "chk_off()",
                 details = "This approach is no longer recommended")
  options(chk.on = FALSE)
}

#' @describeIn chk_deprecated Tests checking on
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
is_chk_on <- function() {
  deprecate_warn("0.2.0", 
                 what = "is_chk_on()",
                 details = "This approach is no longer recommended")
  getOption("chk.on", TRUE)
}
