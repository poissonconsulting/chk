#' Check Not Empty
#'
#' @description
#' Checks if not empty using
#'
#' `length(x) != 0L`
#'
#' **Good**: `1`, `1:2`, `NA`, `matrix(1:3)`, `list(1)`, `data.frame(x = 1)`.
#'
#' **Bad**: `NULL`, `logical(0)`, `list()`, `data.frame()`.
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_miscellaneous
#' @export
#'
#' @examples
#'
#' # chk_not_empty
#' chk_not_empty(1)
#' try(chk_not_empty(numeric(0)))
chk_not_empty <- function(x, x_name = NULL) {
  if (vld_not_empty(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must not be empty (zero length)")
}

#' @describeIn chk_not_empty Validate Not Empty
#'
#' @export
#'
#' @examples
#'
#' # vld_not_empty
#' vld_not_empty(1)
#' vld_not_empty(matrix(1:3))
#' vld_not_empty(character(0))
#' vld_not_empty(list(1))
#' vld_not_empty(NULL)
#' vld_not_empty(list())
vld_not_empty <- function(x) length(x) != 0L
