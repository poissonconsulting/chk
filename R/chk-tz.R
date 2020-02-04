#' Check Time Zone
#'
#' @description
#' Checks if non-missing valid scalar timezone using
#'
#' `is.character(x) && length(x) == 1L && !anyNA(x) && x %in% OlsonNames()`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_scalars
#' @export
#'
#' @examples
#' chk_tz("UTC")
#' try(chk_tz("TCU"))
chk_tz <- function(x, x_name = NULL) {
  if(vld_tz(x)) return(invisible())
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a tz (non-missing scalar character of a recognized timezone)", x = x)
}

#' @describeIn chk_tz Validate Time Zone
#'
#' @export
#' @export
#' @examples
#' vld_tz("UTC")
#' vld_tz("TCU")
vld_tz <- function(x) {
  is.character(x) && length(x) == 1L && !anyNA(x) &&
    x %in% OlsonNames()
}
