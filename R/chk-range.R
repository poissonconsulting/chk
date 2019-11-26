#' Checks range of non-missing values
#'
#' @description
#' Checks all non-missing values fall within range using
#'
#' `all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_ranges
#' @export
#'
#' @examples
#'
#' # chk_range
#' chk_range(0)
#' try(chk_range(-0.1))
chk_range <- function(x, range = c(0, 1), x_name = NULL) {
  if (vld_range(x, range)) {
    return(invisible())
  }

  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    if (range[1] == range[2]) {
      abort_chk(x_name, " must be ", cc(range[1]), ", not ", cc(x))
    }
    abort_chk(
      x_name, " must be between ", cc(range, " and "),
      ", not ", cc(x)
    )
  }
  if (range[1] == range[2]) {
    abort_chk(x_name, " must have values of ", cc(range[1]))
  }
  abort_chk(x_name, " must have values between ", cc(range, " and "))
}

#' @describeIn chk_range Validate Range
#'
#' @export
#'
#' @examples
#'
#' # vld_range
#' vld_range(numeric(0))
#' vld_range(0)
#' vld_range(-0.1)
#' vld_range(c(0.1, 0.2, NA))
#' vld_range(c(0.1, 0.2, NA), range = c(0, 1))
vld_range <- function(x, range = c(0, 1)) {
  all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])
}
