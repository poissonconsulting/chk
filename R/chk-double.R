#' Check Double
#'
#' @description
#' Checks if double using
#'
#' `is.double(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_typeof
#'
#' @examples
#' # chk_double
#' chk_double(1)
#' try(chk_double(1L))
#' @export
chk_double <- function(x, x_name = NULL) {
  if (vld_double(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_double(x, x_name)
}

#' @describeIn chk_double Check Double
#'
#' @examples
#' # check_double
#' check_double(1)
#' try(check_double(1L))
#' @export
check_double <- function(x, x_name = NULL) {
  if (vld_double(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_double(x, x_name)
}

#' @describeIn chk_double Validate Double
#'
#' @examples
#' # vld_double
#' vld_double(1)
#' vld_double(matrix(c(1, 2, 3, 4), nrow = 2L))
#' vld_double(double(0))
#' vld_double(numeric(0))
#' vld_double(NA_real_)
#' vld_double(1L)
#' vld_double(TRUE)
#' @export
vld_double <- function(x) is.double(x)

abort_double <- function(x, x_name) {
  abort_chk(x_name, " must be double", x = x)
}
