#' Check Greater Than
#'
#' @description
#' Checks if all non-missing values are greater than value using
#'
#' `all(x[!is.na(x)] > value)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_ranges
#'
#' @examples
#' # chk_gt
#' chk_gt(0.1)
#' try(chk_gt(c(0.1, -0.2)))
#' @export
chk_gt <- function(x, value = 0, x_name = NULL) {
  if (vld_gt(x, value)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(x_name, " must be greater than ", cc(value), ", not ", cc(x), x = x, value = value)
  }
  abort_chk(x_name, " must have values greater than ", cc(value), x = x, value = value)
}

#' @describeIn chk_gt Validate Greater Than
#'
#' @examples
#' # vld_gt
#' vld_gt(numeric(0))
#' vld_gt(0)
#' vld_gt(0.1)
#' vld_gt(c(0.1, 0.2, NA))
#' vld_gt(c(0.1, -0.2))
#' vld_gt(c(-0.1, 0.2), value = -1)
#' vld_gt("b", value = "a")
#' @export
vld_gt <- function(x, value = 0) all(x[!is.na(x)] > value)
