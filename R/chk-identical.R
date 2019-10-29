#' Check Identical
#'
#' @description
#' Checks if is identical to y using
#'
#' `identical(x, y)`
#'
#' @inheritParams chk_flag
#' @param y An object to check against.
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_equal
#' @export
#'
#' @examples
#'
#' # chk_identical
#' chk_identical(1, 1)
#' try(chk_identical(1, 1L))
#' chk_identical(c(1, 1), c(1, 1))
#' try(chk_identical(1, c(1, 1)))
chk_identical <- function(x, y, x_name = NULL) {
  if(identical(x, y)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y <- utils::capture.output(dput(y, control = "all"))
  abort_chk(x_name, " must be identical to: ", y)
}


#' @describeIn chk_identical Validate Identical
#'
#' @export
#'
#' @examples
#'
#' vld_identical(1, 1)
vld_identical <- function(x, y) identical(x, y)
