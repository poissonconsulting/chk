#' Check Atomic
#'
#' @description
#' Checks if atomic using
#'
#' `is.atomic(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_is
#'
#' @examples
#' # chk_atomic
#' chk_atomic(1)
#' try(chk_atomic(list(1)))
#' @export
chk_atomic <- function(x, x_name = NULL) {
  if (vld_atomic(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be atomic", x = x)
}

#' @describeIn chk_atomic Validate Atomic
#'
#' @examples
#' # vld_atomic
#' vld_atomic(1)
#' vld_atomic(matrix(1:3))
#' vld_atomic(character(0))
#' vld_atomic(list(1))
#' vld_atomic(NULL)
#' @export
vld_atomic <- function(x) is.atomic(x)
