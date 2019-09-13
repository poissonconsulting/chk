#' Deprecated functions
#'
#' Deprecated \code{chk_()} functions.
#'
#' @keywords internal
#' @name chk_deprecated
NULL

#' @describeIn chk_file Check Directories Exist
#' 
#' \lifecycle{soft-deprecated}
#'
#' Checks if directories exist using:
#'
#' \code{all(\link{dir.exists}(x))}
#'
#' @export
chk_dirs <- function(x) {
  deprecate_soft("0.0.1.9010", what = "chk_dirs()", with = "chk_dir()")
  chk_dir(x)
}

#' @describeIn chk_file Check Files Exist
#' 
#' \lifecycle{soft-deprecated}
#'
#' Checks if files exist using:
#'
#' \code{all(\link{file.exists}(x) && !dir.exists(x))}
#'
#' @export
chk_files <- function(x) {
  deprecate_soft("0.0.1.9010", what = "chk_files()", with = "chk_file()")
  chk_file(x)
}

#' @describeIn chk_unique Check Length
#'
#' \lifecycle{deprecated}
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
  abort_chk(x_name, " must be length ", length, ", not ", length(x))
}


#' @describeIn chk_deprecated Check Count
#'
#' \lifecycle{deprecated}
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
#' \lifecycle{deprecated}
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
    " must be a proportion (non-missing numeric scalar between 0 and 1)"
  )
}

#' @describeIn chk_deprecated Check In
#' 
#' \lifecycle{soft-deprecated}
#'
#' Checks if all values in values using \code{chk_subset()}.
#'
#' @export
chk_in <- function(x, values, x_name = NULL) {
  deprecate_soft("0.0.1.9010", what = "chk_in()", 
                 with = "chk_subset()")
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  chk_subset(x, values, x_name = x_name)
}

#' @describeIn chk_deprecated Check Has
#' 
#' \lifecycle{soft-deprecated}
#'
#' Checks if includes all values using \code{chk_superset()}.
#'
#' @export
chk_has <- function(x, values, x_name = NULL) {
  deprecate_soft("0.0.1.9010", what = "chk_has()", 
                 with = "chk_superset()")
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  chk_superset(x, values, x_name = x_name)
}


#' @describeIn chk_deprecated Check Is
#'
#' \lifecycle{soft-deprecated}
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
  deprecate_soft("0.0.1.9018", what = "chk_is()", with = "chk_class_s3()",
                 id = "chk_is")
  if (vld_is(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must inherit from class '", class, "'.")
}

#' @describeIn chk_deprecated Validate Is
#'
#' \lifecycle{soft-deprecated}
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
vld_is <- function(x, class) {
  deprecate_soft("0.0.1.9018", what = "vld_is()", with = "vld_class_s3()", 
                 id = "chk_is")
  inherits(x, class)
}
