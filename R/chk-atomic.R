#' Check Atomic
#'
#' @description
#' Checks if atomic using
#'
#' `is.atomic(x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_is
#' @export
#'
#' @examples
#'
#' # chk_atomic
#' chk_atomic(1)
#' try(chk_atomic(list(1)))
chk_atomic <- function(x, x_name = NULL) {
  if (vld_atomic(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be atomic")
}

#' @describeIn chk_atomic Validate Atomic
#'
#' @export
#'
#' @examples
#'
#' # vld_atomic
#' vld_atomic(1)
#' vld_atomic(matrix(1:3))
#' vld_atomic(character(0))
#' vld_atomic(list(1))
#' vld_atomic(NULL)
vld_atomic <- function(x) is.atomic(x)
