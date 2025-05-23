#' Check Greater Than or Equal To
#'
#' @description
#' Checks if all non-missing values are greater than or equal to y using
#'
#' `all(x[!is.na(x)] >= value)`
#'
#' @inheritParams params
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
#' # chk_gte
#' chk_gte(0)
#' try(chk_gte(-0.1))
#' @export
chk_gte <- function(x, value = 0, x_name = NULL) {
  if (vld_gte(x, value)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(
      x_name, " must be greater than or equal to ", cc(value),
      ", not ", cc(x),
      x = x, value = value
    )
  }
  abort_chk(x_name, " must have values greater than or equal to ", cc(value), x = x, value = value)
}

#' @describeIn chk_gte Validate Greater Than or Equal To
#'
#' @examples
#' # vld_gte
#' vld_gte(numeric(0))
#' vld_gte(0)
#' vld_gte(-0.1)
#' vld_gte(c(0.1, 0.2, NA))
#' vld_gte(c(0.1, 0.2, NA), value = 1)
#' @export
vld_gte <- function(x, value = 0) all(x[!is.na(x)] >= value)
