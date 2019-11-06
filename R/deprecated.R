#' Deprecated functions
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
#' Checks if directories exist using:
#'
#' `all(dir.exists(x))`
#'
#' Replace by [chk_dir()].
#'
#' @export
chk_dirs <- function(x) {
  deprecate_soft("0.2.0", what = "chk_dirs(x)", with = "chk_all(x, chk_dir)")
  chk_all(x, chk_dir)
}

#' @describeIn chk_deprecated Check Files Exist
#'
#' \lifecycle{soft-deprecated}
#'
#' Checks if files exist using:
#'
#' `all(file.exists(x) && !dir.exists(x))`
#'
#' Replace by [chk_file()].
#'
#' @export
chk_files <- function(x) {
  deprecate_soft("0.2.0", what = "chk_files(x)", with = "chk_all(x, chk_file)")
  chk_all(x, chk_file)
}

#' @describeIn chk_deprecated Check Length
#'
#' \lifecycle{deprecated}
#'
#' Checks if is length length using:
#'
#' `length(x) == length`
#'
#' `length` should be a count.
#'
#' Replace by `[chk_range](length(x))`.
#'
#' @param length A count of the length.
#'
#' @export
chk_length <- function(x, length = 1L, x_name = NULL) {
  .Deprecated("chk_range(length(x))")
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
#' Checks if non-missing non-negative integer scalar or double equivalent using:
#'
#' `is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 &&
#'   vld_true(all.equal(x, as.integer(x)))`
#'
#' Replace by [chk_whole_number()] and [chk_gte()].
#'
#' @export
chk_count <- function(x, x_name = NULL) {
  .Deprecated("chk_whole_number(x); chk_gte(x)")

  if(is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 &&
    (is.integer(x) || vld_true(all.equal(x, as.integer(x))))) {
    return(TRUE)
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a count (non-missing non-negative integer scalar or double equivalent)"
  )
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
  .Deprecated("chk_number(x); chk_range(x)")
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
#' Checks if all values in values using `chk_subset()`.
#'
#' Replace by [chk_subset()].
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk_in()",
    with = "chk_subset()"
  )
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_subset(x, values, x_name = x_name)
}

#' @describeIn chk_deprecated Check Has
#'
#' \lifecycle{soft-deprecated}
#'
#' Checks if includes all values using `chk_superset()`.
#'
#' Replace by [chk_superset()].
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk_has()",
    with = "chk_superset()"
  )
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_superset(x, values, x_name = x_name)
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
    what = "chk_is()", with = "chk_s3_class()",
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
    what = "vld_is()", with = "vld_class_s3()",
    id = "chk_is"
  )
  inherits(x, class)
}

#' @describeIn chk_deprecated Check No Missing Values
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
  deprecate_soft("0.2.0", what = "deparse_backtick()", with = "deparse_backtick_chk()")
  deparse_backtick_chk(x)
}


#' @describeIn chk_deprecated Turns checking on
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
chk_on <- function() {
  deprecate_soft("0.2.0", what = "chk_on()")
  options(chk.on = TRUE)
}

#' @describeIn chk_deprecated Turns checking off
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
chk_off <- function() {
  deprecate_soft("0.2.0", what = "chk_off()")
  options(chk.on = FALSE)
}

#' @describeIn chk_deprecated Tests checking on
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
is_chk_on <- function() {
  deprecate_soft("0.2.0", what = "is_chk_on()")
  getOption("chk.on", TRUE)
}
