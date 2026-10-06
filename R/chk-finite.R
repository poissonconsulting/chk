#' Check Finite
#'
#' @description
#' Checks if numeric with all values finite using
#'
#' `is.numeric(x) && all(is.finite(x))`
#'
#' Unlike the other range checkers, missing values fail.
#'
#' **Pass**: `1`, `c(-1, 0, 1e10)`, `2L`, `numeric(0)`.
#'
#' **Fail**: `NA`, `NaN`, `Inf`, `-Inf`, `c(1, NA)`, `TRUE`, `"1"`, `list(1)`.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family range_checkers
#'
#' @seealso [is.finite()]
#' @seealso [chk_numeric()]
#' @seealso [chk_not_any_na()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_finite
#' chk_finite(1)
#' try(chk_finite(Inf))
#' @export
chk_finite <- function(x, x_name = NULL) {
  if (vld_finite(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  if (!is.numeric(x)) {
    abort_chk(x_name, " must be numeric", x = x)
  }
  if (length(x) == 1L) {
    abort_chk(x_name, " must be finite, not ", cc(x), x = x)
  }
  abort_chk(x_name, " must have finite values", x = x)
}

#' @describeIn chk_finite Validate Finite
#'
#' @examples
#' # vld_finite
#' vld_finite(numeric(0))
#' vld_finite(c(-1, 0, 1))
#' vld_finite(c(1, NA))
#' vld_finite(NaN)
#' vld_finite(-Inf)
#' @export
vld_finite <- function(x) is.numeric(x) && all(is.finite(x))
