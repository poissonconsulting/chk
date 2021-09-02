#' Check OR
#'
#' The `chkor()` function has been deprecated for the faster `chkor_vld()`.
#'
#' \lifecycle{soft-deprecated}
#'
#' @param ... Multiple `chk_` functions.
#'
#' @return An informative error if the test fails.
#'
#' @seealso [chk_null_or()]
#'
#' @export
#'
#' @examples
#' chkor()
#' chkor(chk_flag(TRUE))
#' try(chkor(chk_flag(1)))
#' try(chkor(chk_flag(1), chk_flag(2)))
#' chkor(chk_flag(1), chk_flag(TRUE))
chkor <- function(...) {
  lifecycle::deprecate_soft("0.6.1", "chkor()", "chkor_vld()")
  quos <- enquos(...)

  invisible(chkor_quos(quos))
}
