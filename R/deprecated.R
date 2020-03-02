#' Deprecated functions
#'
#'
#' Deprecated `chk_()` functions.
#'
#' @inheritParams chk_flag
#' @keywords internal
#' @name chk_deprecated
NULL

#' @describeIn chk_deprecated Check Count
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by `[chk_whole_number](x); [chk_gte](x)`
#'
#' @export
chk_count <- function(x, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk::chk_count()",
    details = "Please use `chk_whole_number()` and `chk_gte()` instead"
  )
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_whole_number(x)
  chk_gte(x)
}

#' @describeIn chk_deprecated Check Directories Exist
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with `[chk_all](x, [chk_dir])`
#'
#' @export
chk_dirs <- function(x) {
  deprecate_soft("0.2.0",
    what = "chk::chk_dirs()",
    details = "Please use `chk_all(x, chk_dir)` instead"
  )
  chk_all(x, chk_dir)
}

#' @describeIn chk_deprecated Check Files Exist
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with `[chk_all](x, [chk_file])`
#'
#' @export
chk_files <- function(x) {
  deprecate_soft("0.2.0",
    what = "chk::chk_files()",
    details = "Please use `chk_all(x, chk_file)` instead"
  )
  chk_all(x, chk_file)
}

#' @describeIn chk_deprecated Check Has
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [chk_superset()]
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_superset(x, values, x_name = x_name)
  deprecate_soft("0.2.0",
    what = "chk::chk_has()",
    with = "chk::chk_superset()"
  )
  invisible()
}

#' @describeIn chk_deprecated Check In
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [chk_subset()]
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_subset(x, values, x_name = x_name)
  deprecate_soft("0.2.0",
    what = "chk::chk_in()",
    with = "chk::chk_subset()"
  )
  invisible()
}

#' @describeIn chk_deprecated Check Is
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [chk_s3_class()] or [chk_s4_class()]
#'
#' @export
chk_is <- function(x, class, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk::chk_is()",
    details = "Please use `chk_s3_class()` or `chk_s4_class()` instead",
    id = "chk_is"
  )
  if (vld_is(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from class '", class, "'", x = x, class = class)
}

#' @describeIn chk_deprecated Validate Is
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [vld_s3_class()] or [vld_s4_class()]
#'
#' @param class A string of the class of the object.
#'
#' @export
vld_is <- function(x, class) {
  deprecate_soft("0.2.0",
    what = "chk::vld_is()",
    details = "Please use `vld_s3_class()` or `vld_s4_class()` instead",
    id = "chk_is"
  )
  inherits(x, class)
}

#' @describeIn chk_deprecated Check Length
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by `[chk_range](length(x))`
#'
#' @param length A count of the length.
#'
#' @export
chk_length <- function(x, length = 1L, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk::chk_length()",
    with = "chk::chk_range()"
  )
  if (length(x) == length) {
    return(TRUE)
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be length ", length, ", not ", length(x), x = x, length = length)
}

#' @describeIn chk_deprecated Check No Missing Values
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with [chk_not_any_na()]
#'
#' @export
chk_no_missing <- function(x, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk::chk_no_missing()", with = "chk::chk_not_any_na()",
    id = "chk_no_missing"
  )
  if (vld_no_missing(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must not have missing values", x = x)
}

#' @describeIn chk_deprecated Validate No Missing Values
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with [vld_not_any_na()]
#'
#' @export
vld_no_missing <- function(x) {
  deprecate_soft("0.2.0",
    what = "chk::vld_no_missing()", with = "chk::vld_not_any_na()",
    id = "chk_no_missing"
  )
  !anyNA(x)
}

#' @describeIn chk_deprecated Turns checking off
#'
#' \lifecycle{deprecated}
#'
#' This approach is no longer recommended
#'
#' @export
chk_off <- function() {
  deprecate_warn("0.2.0",
    what = "chk::chk_off()",
    details = "This approach is no longer recommended"
  )
  options(chk.on = FALSE)
}

#' @describeIn chk_deprecated Turns checking on
#'
#' \lifecycle{deprecated}
#'
#' This approach is no longer recommended
#'
#' @export
chk_on <- function() {
  deprecate_warn("0.2.0",
    what = "chk::chk_on()",
    details = "This approach is no longer recommended"
  )
  options(chk.on = TRUE)
}

#' @describeIn chk_deprecated Tests checking on
#'
#' \lifecycle{deprecated}
#'
#' This approach is no longer recommended
#'
#' @export
is_chk_on <- function() {
  deprecate_warn("0.2.0",
    what = "chk::is_chk_on()",
    details = "This approach is no longer recommended"
  )
  getOption("chk.on", TRUE)
}

#' @describeIn chk_deprecated Check Proportion
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by `[chk_number](x); [chk_range](x)`
#'
#' @export
chk_proportion <- function(x, x_name = NULL) {
  deprecate_soft("0.2.0",
    what = "chk::chk_proportion()",
    details = "Please use `chk_number(x)` or `chk_range(x)` instead"
  )
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_number(x)
  chk_range(x)
}

#' @describeIn chk_deprecated Deparse Backtick
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace with [deparse_backtick_chk()]
#'
#' @export
deparse_backtick <- function(x) {
  deprecate_soft("0.2.0",
    what = "chk::deparse_backtick()",
    with = "chk::deparse_backtick_chk()"
  )
  deparse_backtick_chk(x)
}
