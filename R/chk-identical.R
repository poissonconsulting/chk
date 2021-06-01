#' Check Identical
#'
#' @description
#' Checks if is identical to y using
#'
#' `identical(x, y)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_equals
#'
#' @examples
#' # chk_identical
#' chk_identical(1, 1)
#' try(chk_identical(1, 1L))
#' chk_identical(c(1, 1), c(1, 1))
#' try(chk_identical(1, c(1, 1)))
#' @export
chk_identical <- function(x, y, x_name = NULL) {
  if (identical(x, y)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y_name <- as_label(y)
  abort_chk(x_name, " must be identical to: ", y_name, x = x, y = y)
}

#' @describeIn chk_identical Validate Identical
#'
#' @examples
#' vld_identical(1, 1)
#' @export
vld_identical <- function(x, y) identical(x, y)

