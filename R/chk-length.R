#' Check Length
#'
#' @description
#' Checks length is a particular value or range using
#'
#' `length(x) >= length && length(x) <= upper`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_misc
#' @seealso [check_dim()]
#'
#' @examples
#' # chk_length
#' chk_length("text")
#' try(vld_length("text", length = 2))
#' @export
chk_length <- function(x, length = 1L, upper = length, x_name = NULL) {
  if (vld_length(x, length, upper)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length == upper) {
    abort_chk(x_name, " must be length ", length, " not ", length(x), x = x, length = length)
  }
  abort_chk(x_name, " must have a length between ", length, " and ", upper, " not ", length(x), x = x, length = length)
}

#' @describeIn chk_length Validate Length
#'
#' @examples
#' # vld_length
#' vld_length(2:1, 2)
#' vld_length(2:1, 1)
#' @export
vld_length <- function(x, length = 1L, upper = length) length(x) >= length && length(x) <= upper
