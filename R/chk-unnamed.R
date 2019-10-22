#' Check Unnamed
#'
#' @description
#' Checks if unnamed using
#'
#' `is.null(names(x))`
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_miscellaneous
#' @export
#'
#' @examples
#'
#' # chk_unnamed
#' chk_unnamed(1)
#' try(chk_unnamed(c(x = 1)))
chk_unnamed <- function(x, x_name = NULL) {
  if(vld_unnamed(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must not be named")
}


#' @describeIn chk_unnamed Validate Unnamed
#'
#' @export
#'
#' @examples
#'
#' # vld_unnamed
#' vld_unnamed(1)
#' vld_unnamed(c(x = 1))
vld_unnamed <- function(x) is.null(names(x))
