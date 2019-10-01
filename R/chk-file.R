#' Check/Validate File or Directory Exist
#'
#' Checks/validates if file or directory exists.
#'
#' If checking/validating multiple files use `chk_all(x, chk_file)`.
#'
#' @inheritParams chk_true
#' @param ext A character vector of the permitted file extensions (without the .).
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_file
NULL

#' @describeIn chk_file Check File
#'
#' Checks if files exist using `vld_file(x)`.
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

#' @describeIn chk_file Check File Extension
#'
#' Checks extension exist using `vld_ext(x)`.
#' 
#' The user may want to use \code{\link{toupper}()} or \code{\link{tolower}()}
#' to ensure the case matches.
#'
#' @export
#'
#' @examples
#'
#' # chk_ext
#' try(chk_ext("file1.pdf", "png"))
chk_ext <- function(x, ext, x_name = NULL) {
  if (vld_ext(x, ext)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  abort_chk(x_name, " must have extension ", cc(ext, " or "), " (not '", 
            tools::file_ext(x),"')")
}

#' @describeIn chk_file Validate File Extension
#'
#' Checks extension using `vld_string(x) && vld_subset(tools::file_ext(x), ext)`.
#'
#' @export
#'
#' @examples
#'
#' # vld_ext
#' vld_ext("oeu.pdf", "pdf")
#' vld_ext(toupper("oeu.pdf"), "PDF")
vld_ext <- function(x, ext) vld_string(x) && vld_subset(tools::file_ext(x), ext)
