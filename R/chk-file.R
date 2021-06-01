#' Check File Exists
#'
#' @description
#' Checks if file exists using
#'
#' `vld_string(x) && file.exists(x) && !dir.exists(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_files
#'
#' @examples
#' # chk_file
#' try(chk_file(tempfile()))
#' @export
chk_file <- function(x, x_name = NULL) {
  if (vld_file(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  if (dir.exists(x)) {
    abort_chk(x_name, " must specify a file ('", x, "' is a directory)", x = x)
  }
  abort_chk(x_name, " must specify an existing file ('", x, "' can't be found)", x = x)
}

#' @describeIn chk_file Validate File Exists
#'
#' @examples
#' # vld_file
#' vld_file(tempfile())
#' @export
vld_file <- function(x) vld_string(x) && file.exists(x) && !dir.exists(x)


