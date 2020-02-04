#' Check Whole Number
#'
#' @description
#'  Checks if non-missing integer scalar or double equivalent using
#'
#' `vld_number(x) && (is.integer(x) || vld_true(all.equal(x, trunc(x))))`
#'
#' **Good**: `1`, `2L`, `1e10`, `-Inf`
#'
#' **Bad**: `"a"`, `1:3`, `NA_integer_`, `log(10)`
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
#'
#' # chk_whole_number
#' chk_whole_number(2)
#' try(chk_whole_number(1.1))
chk_whole_number <- function(x, x_name = NULL) {
  if (vld_whole_number(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a whole number (non-missing integer scalar or double equivalent)",
    x = x
  )
}

#' @describeIn chk_whole_number Validate Whole Number
#'
#' @export
#'
#' @examples
#'
#' # vld_whole_number
#' vld_whole_number(2)
vld_whole_number <- function(x) {
  vld_number(x) &&
    (is.integer(x) || vld_true(all.equal(x, trunc(x))))
}
