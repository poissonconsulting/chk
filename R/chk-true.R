#' Check TRUE
#'
#' @description
#' Checks if TRUE using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x) && x`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_logical
#'
#' @examples
#' # chk_true
#' chk_true(TRUE)
#' try(chk_true(1))
#' @export
chk_true <- function(x, x_name = NULL) {
  if (vld_true(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be TRUE", x = x)
}

#' @describeIn chk_true Validate TRUE
#'
#' @examples
#' # vld_true
#' vld_true(TRUE)
#' vld_true(FALSE)
#' vld_true(NA)
#' vld_true(0)
#' vld_true(c(TRUE, TRUE))
#' @export
vld_true <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x) && x
