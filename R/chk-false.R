#' Check FALSE
#'
#' @description
#' Check if FALSE using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x) && !x`
#'
#' @inheritParams chk_flag
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_logicalscalars
#' @export
#'
#' @examples
#'
#' # chk_false
#' chk_false(FALSE)
#' try(chk_false(0))
chk_false <- function(x, x_name = NULL) {
  if(vld_false(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be FALSE")
}

#' @describeIn chk_false Validate FALSE
#'
#' @export
#'
#' @examples
#'
#' # vld_false
#' vld_false(TRUE)
#' vld_false(FALSE)
#' vld_false(NA)
#' vld_false(0)
#' vld_false(c(FALSE, FALSE))
vld_false <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x) && !x
