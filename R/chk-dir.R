#' Check Directory Exists
#'
#' @description
#' Checks if directory exists using
#'
#' `vld_string(x) && dir.exists(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_files
#' @export
#'
#' @examples
#'
#' # chk_dir
#' chk_dir(tempdir())
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

#' @describeIn chk_dir Validate Directory Exists
#'
#' @export
#'
#' @examples
#'
#' # vld_dir
#' vld_dir(1)
#' vld_dir(tempdir())
#' vld_dir(tempfile())
vld_dir <- function(x) vld_string(x) && dir.exists(x)
