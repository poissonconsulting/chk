#' Check Less Than
#'
#' @description
#' Checks if all non-missing values are less than value using
#'
#' `all(x[!is.na(x)] < value)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family range_checkers
#'
#' @seealso [all()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_lt
#' chk_lt(-0.1)
#' try(chk_lt(c(-0.1, 0.2)))
#' @export
chk_lt <- function(x, value = 0, x_name = NULL) {
  if (vld_lt(x, value)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(x_name, " must be less than ", cc(value), ", not ", cc(x), x = x, value = value)
  }
  abort_chk(x_name, " must have values less than ", cc(value), x = x, value = value)
}

#' @describeIn chk_lt Validate Less Than
#'
#' @examples
#' # vld_lt
#' vld_lt(numeric(0))
#' vld_lt(0)
#' vld_lt(-0.1)
#' vld_lt(c(-0.1, -0.2, NA))
#' vld_lt(c(-0.1, 0.2))
#' vld_lt(c(-0.1, 0.2), value = 1)
#' vld_lt("a", value = "b")
#' @export
vld_lt <- function(x, value = 0) all(x[!is.na(x)] < value)
