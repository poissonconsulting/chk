#' Check/Validate File or Directory Exist
#'
#' Checks/validates if file or directory exists.
#'
#' If checking/validating multiple files use \code{chk_all(x, chk_file)}.
#'
#' @inheritParams chk_true
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_file
NULL

#' @describeIn chk_file Check File
#'
#' Checks if files exist using \code{vld_file(x)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_file
#' try(chk_file(tempfile()))
chk_file <- function(x, x_name = NULL) {
  if (vld_file(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  if (dir.exists(x)) {
    abort_chk(x_name, " must specify a file ('", x, "' is a directory)")
  }
  abort_chk(x_name, " must specify an existing file ('", x, "' can't be found)")
}

#' @describeIn chk_file Validate File
#'
#' Checks if files exist using \code{all(\link{file.exists}(x) && !dir.exists(x))}.
#'
#' @export
#'
#' @examples
#'
#' # vld_file
#' vld_file(tempfile())
vld_file <- function(x) vld_string(x) && file.exists(x) && !dir.exists(x)

#' @describeIn chk_file Check Directories Exist
#'
#' Checks if directories exist using \code{vld_dir()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_dir
#' try(chk_dir(tempfile()))
chk_dir <- function(x, x_name = NULL) {
  if (vld_dir(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  if (file.exists(x)) {
    abort_chk(x_name, " must specify a directory ('", x, "' is a file)")
  }
  abort_chk(x_name, " must specify an existing directory ('", x, "' can't be found)")
}

#' @describeIn chk_file Validate Directories Exist
#'
#' Checks if directories exist using \code{vld_string(x) && all(\link{dir.exists}(x))}.
#'
#' @export
#'
#' @examples
#'
#' # vld_dir
#' vld_dir(tempfile())
vld_dir <- function(x) vld_string(x) && dir.exists(x)
