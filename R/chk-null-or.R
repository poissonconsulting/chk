#' Check NULL Or
#'
#' @description
#' Checks if NULL or passes test.
#'
#' @inheritParams params
#' @param chk A chk function. Soft-deprecated for vld. \lifecycle{soft-deprecated}

#' @param vld A vld function.
#' @param ... Arguments passed to chk.
#'
#' @return An informative error if the test fails.
#' @export
#'
#' @examples
#' chk_null_or(NULL, chk_number)
#' chk_null_or(1, chk_number)
#' try(chk_null_or("1", chk_number))
chk_null_or <- function(x, chk, ..., vld, x_name = NULL) {
  if(!missing(chk)) {
    lifecycle::deprecate_soft("0.6.1", "chk_null_or(chk)", "chk_null_or(vld)")
  }
  if (is.null(x)) {
    return(invisible(x))
  }
  if(missing(vld)) {
    try <- try_chk(chk(x, ...))
    if(is.null(try)) {
      return(invisible(x))
    }

    if (is.null(x_name)) {
      x_name <- deparse_backtick_chk(substitute(x))
      try <- try_chk(chk(x, ..., x_name = x_name))
    }
    msg <- try_msg(try)
    msg <- sub("[.]$", " or NULL.", msg)
    abort_chk(msg, x = x)
  }
  if(vld(x, ...)) return(invisible(x))

  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  chk <- deparse(substitute(vld))
  chk <- sub("^vld_", "chk_", chk)
  chk <- paste0(chk, "(x, ..., x_name = x_name)")
  chk <- parse(text = chk)
  try <- try_chk(eval(chk))
  msg <- try_msg(try)
  msg <- sub("[.]$", " or NULL.", msg)
  abort_chk(msg, x = x)
}
