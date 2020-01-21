#' Check File Extension
#'
#' @description
#' Checks extension using
#'
#' `vld_string(x) && vld_subset(tools::file_ext(x), ext)`
#'
#' The user may want to use [toupper()] or [tolower()]
#' to ensure the case matches.
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
#' # chk_ext
#' try(chk_ext("file1.pdf", "png"))
chk_ext <- function(x, ext, x_name = NULL) {
  if (vld_ext(x, ext)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  abort_chk(
    x_name, " must have extension ", cc(ext, " or "), " (not '",
    tools::file_ext(x), "')"
  )
}

#' @describeIn chk_ext Validate File Extension
#'
#' @export
#'
#' @examples
#'
#' # vld_ext
#' vld_ext("oeu.pdf", "pdf")
#' vld_ext(toupper("oeu.pdf"), "PDF")
vld_ext <- function(x, ext) vld_string(x) && vld_subset(tools::file_ext(x), ext)
