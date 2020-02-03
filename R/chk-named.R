#' Check Named
#'
#' @description
#' Checks if is named using
#'
#' `!is.null(names(x))`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_misc
#' @export
#'
#' @examples
#'
#' # chk_named
#' chk_named(c(x = 1))
#' try(chk_named(list(1)))
chk_named <- function(x, x_name = NULL) {
  if (vld_named(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be named", x = x)
}

#' @describeIn chk_named Validate Named
#'
#' @export
#'
#' @examples
#'
#' # vld_named
#' vld_named(c(x = 1))
#' vld_named(list(x = 1))
#' vld_named(c(x = 1)[-1])
#' vld_named(list(x = 1)[-1])
#' vld_named(1)
#' vld_named(list(1))
vld_named <- function(x) !is.null(names(x))
