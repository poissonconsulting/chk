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
#' @param x_name A string of the name of the object to use in the error
#' message or NULL. If a string it is passed to each of the `chk_` calls so
#' that the error message refers to `x_name` rather than the deparsed `vld_`
#' arguments.
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
#' try(chkor_vld(vld_flag(1), vld_number(1), x_name = "`arg`"))
chkor_vld <- function(..., x_name = NULL) {
  quos <- enquos(...)

  n <- length(quos)
  if (n == 0L) {
    return(invisible())
  }
  for (quo in quos) {
    if (eval_tidy(quo)) {
      return(invisible())
    }
  }
  for (i in seq_len(n)) {
    expr <- vld__to_chk_(quo_get_expr(quos[[i]]))
    if (!is.null(x_name)) {
      expr <- call_modify(expr, x_name = x_name)
    }
    quos[[i]] <- quo_set_expr(quos[[i]], expr)
  }
  chkor_quos(quos)
}
