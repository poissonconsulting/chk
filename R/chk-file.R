#' Check File or Directory Exist
#'
#' @description
#' Checks if file or directory exists using
#'
#' `vld_string(x) && file.exists(x) && !dir.exists(x)`
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_files
#' @export
#'
#' @examples
#'
#' # chk_file
#' try(chk_file(tempfile()))
chk_file <- function(x, x_name = NULL) {
  if(vld_file(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  if(dir.exists(x)) {
    abort_chk(x_name, " must specify a file ('", x, "' is a directory)")
  }
  abort_chk(x_name, " must specify an existing file ('", x, "' can't be found)")
}

#' @describeIn chk_file Validate File
#'
#' @export
#'
#' @examples
#'
#' # vld_file
#' vld_file(tempfile())
vld_file <- function(x) vld_string(x) && file.exists(x) && !dir.exists(x)
