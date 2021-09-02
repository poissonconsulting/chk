try_chk <- function(quo) {
  catch_cnd(eval_tidy(quo), classes = "error")
}

try_msg <- function(x) {
  # FIXME: Tests fail when the code below is changed to conditionMessage(x)
  # because rlang implements conditionMessage.rlang_error() .
  # Does that output look satisfactory?
  conditionMessage.condition(x)
}

chkor_quos <- function(quos) {
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

vld__to_chk_ <- function(quo) {
  str <- deparse(quo)
  str <- sub("^vld_", "chk_", str)
  str2lang(str)
}

#' Chk OR
#'
#' @param ... Multiple `vld_` calls.
#'
#' A common mistake is to pass `chk_` calls.
#'
#' `chkor_vld()` is relatively slow.
#' If at all possible use [chk_null_or()] or first test using the individual
#' `vld_` functions and then call `chkor_vld()` to generate an informative
#' error message.
#'
#' @return An informative error if the test fails.
#'
#' @seealso [chk_null_or()]
#'
#' @export
#'
#' @examples
#' chkor_vld()
#' chkor_vld(vld_flag(TRUE))
#' try(chkor_vld(vld_flag(1)))
#' try(chkor_vld(vld_flag(1), vld_flag(2)))
#' chkor_vld(vld_flag(1), vld_flag(TRUE))
chkor_vld <- function(...) {
  quos <- enquos(...)

  n <- length(quos)
  if (n == 0L) {
    return(invisible())
  }
  for (quo in quos) {
    if(eval_tidy(quo))
      return(invisible())
  }
  for (i in seq_len(n)) {
    quos[[i]] <- quo_set_expr(quos[[i]], vld__to_chk_(quo_get_expr(quos[[i]])))
  }
  chkor_quos(quos)
}
