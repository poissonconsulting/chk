#' Check Factor
#'
#' @description
#' Checks if factor using
#'
#' `is.factor(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
#'
#' @examples
#' # chk_factor
#' chk_factor(factor("1"))
#' try(chk_factor("1"))
#' @export
chk_factor <- function(x, x_name = NULL) {
  if (vld_factor(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be factor", x = x)
}

#' @describeIn chk_factor Validate Factor
#'
#' @examples
#' # vld_factor
#' vld_factor(factor("1"))
#' vld_factor(factor(0))
#' vld_factor("1")
#' vld_factor(1L)
#' @export
vld_factor <- function(x) is.factor(x)
