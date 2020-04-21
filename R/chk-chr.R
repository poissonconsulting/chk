#' Check Character Scalar
#'
#' @description
#' Checks if character scalar using
#'
#' `is.character(x) && length(x) == 1L`
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
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be a character scalar", x = x)
}

#' @describeIn chk_chr Validate Character Scalar
#'
#' @examples
#' # vld_chr
#' vld_chr("")
#' vld_chr("a")
#' vld_chr(NA_character_)
#' vld_chr(c("a", "b"))
#' vld_chr(1)
#' @export
vld_chr <- function(x) is.character(x) && length(x) == 1L
