#' Check Directory Exists
#'
#' @description
#' Checks if directory exists using
#'
#' `vld_string(x) && dir.exists(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_files
#'
#' @examples
#' # chk_dir
#' chk_dir(tempdir())
#' try(chk_dir(tempfile()))
#' @export
chk_dir <- function(x, x_name = NULL) {
  if (vld_dir(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  if (file.exists(x)) {
    abort_chk(x_name, " must specify a directory ('", x, "' is a file)", x = x)
  }
  abort_chk(x_name, " must specify an existing directory ('", x, "' can't be found)", x = x)
}

#' @describeIn chk_dir Validate Directory Exists
#'
#' @examples
#' # vld_dir
#' vld_dir(1)
#' vld_dir(tempdir())
#' vld_dir(tempfile())
#' @export
vld_dir <- function(x) vld_string(x) && dir.exists(x)
