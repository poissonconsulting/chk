#' Check NULL Or
#'
#' @description
#' Checks if NULL or passes test.
#'
#' @inheritParams params
#' @param chk A chk function.
#' @param ... Arguments passed to chk.
#'
#' @return An informative error if the test fails.
#' @export
#'
#' @examples
#' chk_null_or(NULL, chk_number)
#' chk_null_or(1, chk_number)
#' try(chk_null_or("1", chk_number))
chk_null_or <- function(x, chk, ..., x_name = NULL) {
  if (is.null(x)) return(invisible())
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  try <- try_chk(chk(x, ..., x_name = x_name))
  if (is.null(try)) {
    return(invisible())
  }
  msg <- try_msg(try)
  msg <- sub("[.]$", " or NULL.", msg)
  abort_chk(msg, x = x)
}
