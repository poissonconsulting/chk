#' Check/Validate Date or DateTime
#'
#' Checks/validates if Date or POSIXct.
#'
#' @inheritParams chk_true
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_date
NULL

#' @describeIn chk_date Check Date
#'
#' Checks if non-missing Date scalar using \code{vld_date()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_date
#' chk_date(Sys.Date())
#' try(chk_date(1))
chk_date <- function(x, x_name = NULL) {
  if (vld_date(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a date (non-missing Date scalar)")
}

#' @describeIn chk_date Validate Date
#'
#' Validates non-missing Date scalar using
#' \code{inherits(x, "Date") && length(x) == 1L && !anyNA(x)}
#'
#' @export
#'
#' @examples
#'
#' # vld_date
#' vld_date(Sys.Date())
#' vld_date(Sys.time())
#' vld_date(1)
vld_date <- function(x) inherits(x, "Date") && length(x) == 1L && !anyNA(x)

#' @describeIn chk_date Check DateTime
#'
#' Checks if non-missing POSIXct scalar using \code{vld_datetime()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_datetime
#' chk_datetime(as.POSIXct("2001-01-02"))
#' try(chk_datetime(1))
chk_datetime <- function(x, x_name = NULL) {
  if (vld_datetime(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a datetime (non-missing POSIXct scalar)")
}

#' @describeIn chk_date Validates DateTime
#'
#' Validates non-missing POSIXct scalar using
#' \code{inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)}
#'
#' @export
#'
#' @examples
#'
#' # vld_datetime
#' vld_datetime(as.POSIXct("2001-01-02"))
#' vld_datetime(Sys.time())
#' vld_datetime(1)
#' vld_datetime("2001-01-02")
#' vld_datetime(c(Sys.time(), Sys.time()))
vld_datetime <- function(x, x_name = NULL) {
  inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)
}
