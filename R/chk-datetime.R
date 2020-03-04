#' Check DateTime
#'
#' @description
#' Checks if non-missing POSIXct scalar using
#'
#' `inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_scalars
#'
#' @examples
#' # chk_datetime
#' chk_datetime(as.POSIXct("2001-01-02"))
#' try(chk_datetime(1))
#' @export
chk_datetime <- function(x, x_name = NULL) {
  if (vld_datetime(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a datetime (non-missing POSIXct scalar)", x = x)
}

#' @describeIn chk_datetime Validate DateTime
#'
#' @examples
#' # vld_datetime
#' vld_datetime(as.POSIXct("2001-01-02"))
#' vld_datetime(Sys.time())
#' vld_datetime(1)
#' vld_datetime("2001-01-02")
#' vld_datetime(c(Sys.time(), Sys.time()))
#' @export
vld_datetime <- function(x, x_name = NULL) {
  inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)
}
