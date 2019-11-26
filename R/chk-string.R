#' Check String
#'
#' @description
#' Checks if string
#'
#' `is.character(x) && length(x) == 1L && !anyNA(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_scalars
#' @export
#'
#' @examples
#'
#' # chk_string
#' chk_string("1")
#' try(chk_string(1))
chk_string <- function(x, x_name = NULL) {
  if (is.character(x) && length(x) == 1L && !anyNA(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a string (non-missing character scalar)")
}

#' @describeIn chk_string Validate String
#'
#' @export
#'
#' @examples
#'
#' # vld_string
#' vld_string("1")
#' vld_string("")
#' vld_string(1)
#' vld_string(NA_character_)
#' vld_string(c("1", "1"))
vld_string <- function(x, x_name = NULL) {
  is.character(x) && length(x) == 1L && !anyNA(x)
}
