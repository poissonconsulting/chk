#' Check Character
#'
#' @description
#' Checks if character using
#'
#' `is.character(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
#'
#' @examples
#' # chk_character
#' chk_character("1")
#' try(chk_character(1))
#' @export
chk_character <- function(x, x_name = NULL) {
  if (vld_character(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be character", x = x)
}

#' @describeIn chk_character Validate Character
#'
#' @examples
#' # vld_character
#' vld_character("1")
#' vld_character(matrix("a"))
#' vld_character(character(0))
#' vld_character(NA_character_)
#' vld_character(1)
#' vld_character(TRUE)
#' vld_character(factor("text"))
#' @export
vld_character <- function(x) is.character(x)
