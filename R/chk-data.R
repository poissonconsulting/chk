#' Check Data
#'
#' @description
#' Checks data.frame using
#'
#' `inherits(x, "data.frame")`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_data
#' chk_data(data.frame(x = 1))
#' try(chk_data(1))
chk_data <- function(x, x_name = NULL) {
  if (vld_data(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a data.frame", x = x)
}

#' @describeIn chk_date Validate Data
#'
#' @export
#'
#' @examples
#'
#' # vld_data
#' vld_data(data.frame())
#' vld_data(data.frame(x = 1))
#' vld_data(c(x = 1))
vld_data <- function(x) inherits(x, "data.frame")
