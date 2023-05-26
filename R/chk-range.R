#' Checks range of non-missing values
#'
#' @description
#' Checks all non-missing values fall within range using
#'
#' If inclusive
#'
#' `all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])`
#'
#' else
#'
#' `all(x[!is.na(x)] > range[1] & x[!is.na(x)] < range[2])`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_ranges
#'
#' @examples
#' # chk_range
#' chk_range(0)
#' try(chk_range(-0.1))
#' @export
chk_range <- function(x, range = c(0, 1), inclusive = TRUE, x_name = NULL) {
  if (vld_range(x, range, inclusive)) {
    return(invisible(x))
  }

  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  if (length(x) == 1L) {
    if (inclusive && range[1] == range[2]) {
      abort_chk(x_name, " must be ", cc(range[1]), ", not ", cc(x), x = x, range = range)
    }
    abort_chk(
      x_name, " must be between ", cc(range, " and "),
      ifelse(isTRUE(inclusive), "", " exclusive"),
      ", not ", cc(x)
    )
  }
  if (inclusive && range[1] == range[2]) {
    abort_chk(x_name, " must have values of ", cc(range[1]), x = x, range = range)
  }
  abort_chk(x_name, " must have values between ", cc(range, " and "),
            ifelse(isTRUE(inclusive), "", " exclusive"),
            x = x, range = range)
}

#' @describeIn chk_range Validate Range
#'
#' @examples
#' # vld_range
#' vld_range(numeric(0))
#' vld_range(0)
#' vld_range(-0.1)
#' vld_range(c(0.1, 0.2, NA))
#' vld_range(c(0.1, 0.2, NA), range = c(0, 1))
#' @export
vld_range <- function(x, range = c(0, 1), inclusive = TRUE) {
  if(isTRUE(inclusive)) {
    return(all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2]))
  }
  all(x[!is.na(x)] > range[1] & x[!is.na(x)] < range[2])
}
