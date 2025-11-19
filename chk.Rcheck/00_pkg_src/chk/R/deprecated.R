#' Deprecated functions
#'
#'
#' Deprecated `chk_()` functions.
#'
#' @family deprecated
#'
#' @inheritParams chk_flag
#' @keywords internal
#' @name chk_deprecated
NULL

#' @describeIn chk_deprecated Check Directories Exist
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace with `[chk_all](x, [chk_dir])`
#'
#' @export
chk_dirs <- function(x) {
  deprecate_warn("0.2.0",
    what = "chk::chk_dirs()",
    details = "Please use `chk_all(x, chk_dir)` instead"
  )
  chk_all(x, chk_dir)
}

#' @describeIn chk_deprecated Check Files Exist
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace with `[chk_all](x, [chk_file])`
#'
#' @export
chk_files <- function(x) {
  deprecate_warn("0.2.0",
    what = "chk::chk_files()",
    details = "Please use `chk_all(x, chk_file)` instead"
  )
  chk_all(x, chk_file)
}

#' @describeIn chk_deprecated Check Has
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace by [chk_superset()]
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_superset(x, values, x_name = x_name)
  deprecate_warn("0.2.0",
    what = "chk::chk_has()",
    with = "chk::chk_superset()"
  )
  invisible()
}

#' @describeIn chk_deprecated Check In
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace by [chk_subset()]
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_subset(x, values, x_name = x_name)
  deprecate_warn("0.2.0",
    what = "chk::chk_in()",
    with = "chk::chk_subset()"
  )
  invisible()
}

#' @describeIn chk_deprecated Check No Missing Values
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace with [chk_not_any_na()]
#'
#' @export
chk_no_missing <- function(x, x_name = NULL) {
  deprecate_warn("0.2.0",
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
#' `r lifecycle::badge("deprecated")`
#'
#' Replace with [vld_not_any_na()]
#'
#' @export
vld_no_missing <- function(x) {
  deprecate_warn("0.2.0",
    what = "chk::vld_no_missing()", with = "chk::vld_not_any_na()",
    id = "chk_no_missing"
  )
  !anyNA(x)
}

#' @describeIn chk_deprecated Turns checking off
#'
#' `r lifecycle::badge("deprecated")`
#'
#' This approach is no longer recommended
#'
#' @export
chk_off <- function() {
  deprecate_stop("0.2.0",
    what = "chk::chk_off()",
    details = "This approach is no longer recommended"
  )
  options(chk.on = FALSE)
}

#' @describeIn chk_deprecated Turns checking on
#'
#' `r lifecycle::badge("deprecated")`
#'
#' This approach is no longer recommended
#'
#' @export
chk_on <- function() {
  deprecate_stop("0.2.0",
    what = "chk::chk_on()",
    details = "This approach is no longer recommended"
  )
  options(chk.on = TRUE)
}

#' @describeIn chk_deprecated Tests checking on
#'
#' `r lifecycle::badge("deprecated")`
#'
#' This approach is no longer recommended
#'
#' @export
is_chk_on <- function() {
  deprecate_stop("0.2.0",
    what = "chk::is_chk_on()",
    details = "This approach is no longer recommended"
  )
  getOption("chk.on", TRUE)
}

#' @describeIn chk_deprecated Check Proportion
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace by `[chk_number](x); [chk_range](x)`
#'
#' @export
chk_proportion <- function(x, x_name = NULL) {
  deprecate_warn("0.2.0",
    what = "chk::chk_proportion()",
    details = "Please use `chk_number(x)` or `chk_range(x)` instead"
  )
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_number(x)
  chk_range(x)
}

#' @describeIn chk_deprecated Deparse Backtick
#'
#' `r lifecycle::badge("deprecated")`
#'
#' Replace with [deparse_backtick_chk()]
#'
#' @export
deparse_backtick <- function(x) {
  deprecate_warn("0.2.0",
    what = "chk::deparse_backtick()",
    with = "chk::deparse_backtick_chk()"
  )
  deparse_backtick_chk(x)
}
