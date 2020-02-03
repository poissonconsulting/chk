#'  Check List
#'
#' @description
#' Checks if is a list using
#'
#' `is.list(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_list
#' chk_list(list())
#' try(chk_list(1))
chk_list <- function(x, x_name = NULL) {
  if (vld_list(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a list", x = x)
}

#' @describeIn chk_list Validate List
#'
#' @export
#'
#' @examples
#'
#' # vld_list
#' vld_list(list())
#' vld_list(list(x = 1))
#' vld_list(mtcars)
#' vld_list(1)
#' vld_list(NULL)
vld_list <- function(x) is.list(x)
