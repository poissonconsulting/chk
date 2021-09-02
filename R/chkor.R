try_chk <- function(quo) {
  catch_cnd(eval_tidy(quo), classes = "error")
}

try_msg <- function(x) {
  # FIXME: Tests fail when the code below is changed to conditionMessage(x)
  # because rlang implements conditionMessage.rlang_error() .
  # Does that output look satisfactory?
  conditionMessage.condition(x)
}

#' Check OR
#'
#' The `chkor()` function has been deprecated because it is too slow.
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
  lifecycle::deprecate_soft("0.6.1", "chkor()",
                            details = "`chkor()` is slow. Use `chk_null_or()` if possible or write a custom test.")
  quos <- enquos(...)

  n <- length(quos)
  if (n == 0L) {
    return(invisible())
  }

  msg <- character(n)
  for (i in seq_len(n)) {
    try <- try_chk(quos[[i]])
    if (is.null(try)) {
      return(invisible())
    }
    msg[[i]] <- try_msg(try)
  }
  msg <- unique(msg)
  if (length(msg) > 1) {
    msg <- p0(msg, collapse = "\n* ")
    msg <- p0("At least one of the following conditions must be met:\n* ", msg)
  }
  abort_chk(msg)
}
