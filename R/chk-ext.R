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
#' @inherit params return
#'
#' @family chk_files
#'
#' @examples
#' # chk_ext
#' try(chk_ext("file1.pdf", "png"))
#' @export
chk_ext <- function(x, ext, x_name = NULL) {
  if (vld_ext(x, ext)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_string(x, x_name = x_name)
  abort_chk(
    x_name, " must have extension ", cc(ext, " or "), " (not '",
    tools::file_ext(x), "')",
    x = x, ext = ext
  )
}

#' @describeIn chk_ext Validate File Extension
#'
#' @examples
#' # vld_ext
#' vld_ext("oeu.pdf", "pdf")
#' vld_ext(toupper("oeu.pdf"), "PDF")
#' @export
vld_ext <- function(x, ext) vld_string(x) && vld_subset(tools::file_ext(x), ext)
