#' Check Less Than or Equal To
#'
#' @description
#' Checks if all non-missing values are less than or equal to y using
#'
#' `all(x[!is.na(x)] <= value)`
#'
#' If `value` is the same length as `x` the values are compared
#' element-wise and pairs with a missing value are ignored.
#'
#' @inheritParams params
#' @param value A non-missing scalar, or a vector of the same length as `x`,
#'   of the value(s) to compare against.
#' @inherit params return
#'
#' @family range_checkers
#'
#' @seealso [all()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
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
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  if (length(x) == 1L) {
    abort_chk(
      x_name,
      " must be less than or equal to ",
      cc(value),
      ", not ",
      cc(x),
      x = x,
      value = value
    )
  }
  if (length(value) > 1L) {
    fails <- which(compare_fails(x, value, `<=`))
    abort_chk(
      x_name,
      " must have values less than or equal to the corresponding values of `value`",
      ", not at position%s ",
      cc(fails, " and "),
      n = length(fails),
      x = x,
      value = value
    )
  }
  abort_chk(
    x_name,
    " must have values less than or equal to ",
    cc(value),
    x = x,
    value = value
  )
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
#' vld_lte(c(1, NA, 3), value = c(2, 0, NA))
#' @export
vld_lte <- function(x, value = 0) {
  vld_compare(x, value, `<=`)
}
