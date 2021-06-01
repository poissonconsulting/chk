#' Check Less Than or Equal To
#'
#' @description
#' Checks if all non-missing values are less than or equal to y using
#'
#' `all(x[!is.na(x)] <= value)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_ranges
#'
#' @examples
#' # chk_lte
#' chk_lte(0)
#' try(chk_lte(0.1))
#' @export
chk_lte <- function(x, value = 0, x_name = NULL) {
  if (vld_lte(x, value)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(
      x_name, " must be less than or equal to ", cc(value), ", not ", cc(x),
      "")
  }
  abort_chk(x_name, " must have values less than or equal to ", cc(value), x = x, value = value)
}

#' @describeIn chk_lte Validate Less Than or Equal To
#'
#' @examples
#' # vld_lte
#' vld_lte(numeric(0))
#' vld_lte(0)
#' vld_lte(0.1)
#' vld_lte(c(-0.1, -0.2, NA))
#' vld_lte(c(-0.1, -0.2, NA), value = -1)
#' @export
vld_lte <- function(x, value = 0) all(x[!is.na(x)] <= value)

