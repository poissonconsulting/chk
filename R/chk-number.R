#' Check Number
#'
#' @description
#' Checks if non-missing numeric scalar using
#'
#' `is.numeric(x) && length(x) == 1L && !anyNA(x)`
#'
#' **Good**: `1`, `2L`, `log(10)`, `-Inf`
#'
#' **Bad**: `"a"`, `1:3`, `NA_real_`
#'
#' @inheritParams chk_flag
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
#' # chk_number
#' chk_number(1.1)
#' try(chk_number(TRUE))
chk_number <- function(x, x_name = NULL) {
  if(vld_number(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a number (non-missing numeric scalar)")
}

#' @describeIn chk_number Validate Number
#'
#' @export
#'
#' @examples
#'
#' # vld_number
#' vld_number(1.1)
vld_number <- function(x) {
  is.numeric(x) && length(x) == 1L && !anyNA(x)
}
