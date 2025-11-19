#' Check Time Zone
#'
#' @description
#' Checks if non-missing valid scalar timezone using
#'
#' `is.character(x) && length(x) == 1L && !anyNA(x) && x %in% OlsonNames()`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family tz_checkers
#' @family date_checkers
#' @family scalar_checkers
#'
#' @seealso [length()]
#' @seealso [OlsonNames()]
#' @seealso [is.character()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' chk_tz("UTC")
#' try(chk_tz("TCU"))
#' @export
chk_tz <- function(x, x_name = NULL) {
  if (vld_tz(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a tz (non-missing scalar character of a recognized timezone)", x = x)
}

#' @describeIn chk_tz Validate Time Zone
#'
#' @examples
#' vld_tz("UTC")
#' vld_tz("TCU")
#' @export
vld_tz <- function(x) {
  is.character(x) && length(x) == 1L && !anyNA(x) &&
    x %in% OlsonNames()
}
