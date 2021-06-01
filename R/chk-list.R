#'  Check List
#'
#' @description
#' Checks if is a list using
#'
#' `is.list(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
#'
#' @examples
#' # chk_list
#' chk_list(list())
#' try(chk_list(1))
#' @export
chk_list <- function(x, x_name = NULL) {
  if (vld_list(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a list", x = x)
}

#' @describeIn chk_list Validate List
#'
#' @examples
#' # vld_list
#' vld_list(list())
#' vld_list(list(x = 1))
#' vld_list(mtcars)
#' vld_list(1)
#' vld_list(NULL)
#' @export
vld_list <- function(x) is.list(x)

