#' Check Raw
#'
#' @description
#' Checks if raw using
#'
#' `is.raw(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_type_checkers
#'
#' @seealso [is.raw()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_raw
#' chk_raw(as.raw(1))
#' try(chk_raw(1))
#' @export
chk_raw <- function(x, x_name = NULL) {
  if (vld_raw(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be raw", x = x)
}

#' @describeIn chk_raw Validate Raw
#'
#' @examples
#' # vld_raw
#' vld_raw(as.raw(1))
#' vld_raw(raw(0))
#' vld_raw(1)
#' vld_raw(TRUE)
#' @export
vld_raw <- function(x) is.raw(x)
