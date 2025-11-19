#' Check not NULL
#'
#' @description
#' Checks if not NULL using
#'
#' `!is.null(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family null_checkers
#'
#' @seealso [is.null()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_not_null
#' try(chk_not_null(NULL))
#' chk_not_null(1)
#' @export
chk_not_null <- function(x, x_name = NULL) {
  if (vld_not_null(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must not be NULL", x = x)
}

#' @describeIn chk_not_null Validate Not NULL
#'
#' @examples
#' # vld_not_null
#' vld_not_null(1)
#' vld_not_null(NULL)
#' @export
vld_not_null <- function(x) !is.null(x)
