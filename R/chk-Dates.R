#' Check Date(s)
#'
#' @description
#' Checks if Date vector using
#'
#' `inherits(x, "Date")`
#'
#' @inheritParams params
#' @inherit params return
#' @aliases chk_Dates
#'
#' @examples
#' # chk_Dates
#' chk_Dates(Sys.Date())
#' try(chk_Dates(1))
#' @export
chk_Dates <- function(x, x_name = NULL) {
  if (vld_Dates(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be Date", x = x)
}

#' @describeIn chk_Dates Validate Date
#'
#' @examples
#' # vld_Dates
#' vld_Dates(Sys.Date())
#' vld_Dates(1)
#' @export
vld_Dates <- function(x) inherits(x, "Date")
