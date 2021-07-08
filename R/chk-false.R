#' Check FALSE
#'
#' @description
#' Check if FALSE using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x) && !x`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_logical
#'
#' @examples
#' # chk_false
#' chk_false(FALSE)
#' try(chk_false(0))
#' @export
chk_false <- function(x, x_name = NULL) {
  if (vld_false(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be FALSE", x = x)
}

#' @describeIn chk_false Validate FALSE
#'
#' @examples
#' # vld_false
#' vld_false(TRUE)
#' vld_false(FALSE)
#' vld_false(NA)
#' vld_false(0)
#' vld_false(c(FALSE, FALSE))
#' @export
vld_false <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x) && !x
