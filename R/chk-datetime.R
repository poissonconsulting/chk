#' Check Date Time
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
#' # chk_date_time
#' chk_date_time(as.POSIXct("2001-01-02"))
#' try(chk_date_time(1))
#' @export
chk_date_time <- function(x, x_name = NULL) {
  if (vld_date_time(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a date time (non-missing POSIXct scalar)", x = x)
}

#' @describeIn chk_date_time Check Date Time (Deprecated)
#'
#' \lifecycle{deprecated}
#'
#' @export
chk_datetime <- function(x, x_name = NULL) {
  deprecate_warn("0.4.1",
    what = "chk::chk_datetime()",
    with = "chk::chk_date_time()",
    id = "chk_datetime"
  )
  if (vld_date_time(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a date time (non-missing POSIXct scalar)", x = x)
}

#' @describeIn chk_date_time Validate Date Time
#'
#' @examples
#' # vld_date_time
#' vld_date_time(as.POSIXct("2001-01-02"))
#' vld_date_time(Sys.time())
#' vld_date_time(1)
#' vld_date_time("2001-01-02")
#' vld_date_time(c(Sys.time(), Sys.time()))
#' @export
vld_date_time <- function(x) {
  inherits(x, "POSIXct") && length(x) == 1L && !anyNA(x)
}

#' @describeIn chk_date_time Validate Date Time (Deprecated)
#'
#' \lifecycle{deprecated}
#'
#' @export
vld_datetime <- function(x) {
  deprecate_warn("0.4.1",
    what = "chk::vld_datetime()",
    with = "chk::vld_date_time()",
    id = "chk_datetime"
  )
  vld_date_time(x)
}
