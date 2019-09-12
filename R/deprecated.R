#' Deprecated functions
#'
#' Deprecated \code{chk_()} functions.
#'
#' @keywords internal
#' @name chk_deprecated
NULL

#' @describeIn chk_file Check Directories Exist (DEPRECATED)
#'
#' Checks if directories exist using:
#'
#' \code{all(\link{dir.exists}(x))}
#'
#' @export
chk_dirs <- function(x) {
  .Deprecated("chk_dir")
  chk_dir(x)
}

#' @describeIn chk_file Check Files Exist (DEPRECATED)
#'
#' Checks if files exist using:
#'
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#'
#' @export
chk_files <- function(x) {
  .Deprecated("chk_file")
  chk_file(x)
}

#' @describeIn chk_unique Check Length
#'
#'
#' Checks if is length length using:
#'
#' \code{length(x) == length}
#'
#' \code{length} should be a count.
#'
#' @param length A count of the length.
#'
#' @export
chk_length <- function(x, length = 1L, x_name = NULL) {
  .Deprecated("chk_range(length(x))")
  if (length(x) == length) {
    return(TRUE)
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be length ", length, ", not ", length(x), ".")
}


#' @describeIn chk_deprecated Check Count
#'
#' Checks if non-missing non-negative integer scalar or double equivalent using:
#'
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 &&
#'   vld_true(all.equal(x, as.integer(x)))}
#'
#' @export
chk_count <- function(x, x_name = NULL) {
  .Deprecated("chk_whole_number(x); chk_gte(x)")

  if (is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 &&
    (is.integer(x) || vld_true(all.equal(x, as.integer(x))))) {
    return(TRUE)
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(
    x_name,
    " must be a count (non-missing non-negative integer scalar or double equivalent)."
  )
}


#' @describeIn chk_deprecated Check Proportion
#'
#' Checks if non-missing numeric scalar between 0 and 1 using:
#'
#' \code{is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1}
#'
#' @export
chk_proportion <- function(x, x_name = NULL) {
  .Deprecated("chk_number(x); chk_range(x)")
  if (is.numeric(x) && length(x) == 1L && !anyNA(x) && x >= 0 && x <= 1) {
    return(TRUE)
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(
    x_name,
    " must be a proportion (non-missing numeric scalar between 0 and 1)."
  )
}

#' @describeIn chk_deprecated Check In
#'
#' Checks if all values in values using \code{chk_subset()}.
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  .Deprecated("chk_subset")
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  chk_subset(x, values, x_name = x_name)
}

#' @describeIn chk_deprecated Check Has
#'
#' Checks if includes all values using \code{chk_superset()}.
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  .Deprecated("chk_superset")
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  chk_superset(x, values, x_name = x_name)
}
