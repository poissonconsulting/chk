#' Check Character or Factor
#'
#' @description
#' Checks if character or factor using
#'
#' `is.character(x) || is.factor(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
#'
#' @examples
#' # chk_character_or_factor
#' chk_character_or_factor("1")
#' chk_character_or_factor(factor("1"))
#' try(chk_character(1))
#' @export
chk_character_or_factor <- function(x, x_name = NULL) {
  if (vld_character_or_factor(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be character or factor", x = x)
}

#' @describeIn chk_character_or_factor Validate Character or Factor
#'
#' @examples
#' # vld_character_or_factor
#' vld_character_or_factor("1")
#' vld_character_or_factor(matrix("a"))
#' vld_character_or_factor(character(0))
#' vld_character_or_factor(NA_character_)
#' vld_character_or_factor(1)
#' vld_character_or_factor(TRUE)
#' vld_character_or_factor(factor("text"))
#' @export
vld_character_or_factor <- function(x) is.character(x) || is.factor(x)
