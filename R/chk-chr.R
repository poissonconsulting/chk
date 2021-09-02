#' Check Character Scalar
#'
#' @description
#' Checks if character scalar using
#'
#' `is.character(x) && length(x) == 1L`
#'
#' \lifecycle{soft-deprecated}
#'
#' @family deprecated
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_character
#'
#' @examples
#' chk_chr("a")
#' try(chk_chr(1))
#' @export
chk_chr <- function(x, x_name = NULL) {
  if (vld_chr(x)) {
    return(invisible(x))
  }
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_chr()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_character(x)` instead",
    id = "chk_chr"
  )

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a character scalar", x = x)
}

#' @describeIn chk_chr Validate Character Scalar
#'
#' \lifecycle{soft-deprecated}
#'
#' @examples
#' # vld_chr
#' vld_chr("")
#' vld_chr("a")
#' vld_chr(NA_character_)
#' vld_chr(c("a", "b"))
#' vld_chr(1)
#' @export
vld_chr <- function(x) {
  deprecate_soft(
    "0.6.1",
    what = "chk::chk_chr()",
    details = "Please use `chk::chk_scalar(x);` `chk::chk_character(x)` instead",
    id = "chk_chr"
  )

  is.character(x) && length(x) == 1L
}
