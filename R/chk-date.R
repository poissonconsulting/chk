#' Check Date
#'
#' @description
#' Checks non-missing Date scalar using
#'
#' `inherits(x, "Date") && length(x) == 1L && !anyNA(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_scalars
#'
#' @examples
#' # chk_date
#' chk_date(Sys.Date())
#' try(chk_date(1))
#' @export
chk_date <- function(x, x_name = NULL) {
  if (vld_date(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a date (non-missing Date scalar)", x = x)
}

#' @describeIn chk_date Validate Date
#'
#' @examples
#' # vld_date
#' vld_date(Sys.Date())
#' vld_date(Sys.time())
#' vld_date(1)
#' @export
vld_date <- function(x) inherits(x, "Date") && length(x) == 1L && !anyNA(x)
