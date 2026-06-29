#' Check NULL Or
#'
#' @description
#' Checks if NULL or passes test.
#'
#' @inheritParams params
#' @param chk A chk function. Soft-deprecated for vld. `r lifecycle::badge("deprecated")`

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
  if (!missing(chk)) {
    lifecycle::deprecate_soft("0.6.1", "chk_null_or(chk)", "chk_null_or(vld)")
  }
  if (is.null(x)) {
    return(invisible(x))
  }
  if (missing(vld)) {
    try <- try_chk(chk(x, ...))
    if (is.null(try)) {
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
  if (vld(x, ...)) {
    return(invisible(x))
  }

  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }

  # Reuse the matching chk_ function's informative message if it can be found.
  chk <- vld_partner_chk(substitute(vld), vld)
  if (!is.null(chk)) {
    try <- try_chk(chk(x, ..., x_name = x_name))
    if (!is.null(try)) {
      msg <- try_msg(try)
      msg <- sub("[.]$", " or NULL.", msg)
      abort_chk(msg, x = x)
    }
  }
  abort_chk(x_name, " must be valid or NULL", x = x)
}

# Find the chk_ function that partners a vld_ function.
# `vld_call` is the (unevaluated) expression supplied as the `vld` argument and
# `vld_fun` the evaluated function. Returns the chk_ function or NULL if it
# cannot be resolved (e.g. an anonymous function or a function passed by
# variable). The partner is looked up in the vld_ function's own environment so
# that chk_/vld_ pairs defined in other packages are supported too.
vld_partner_chk <- function(vld_call, vld_fun) {
  name <- paste0(deparse(vld_call), collapse = "")
  name <- sub("^[A-Za-z0-9._]+::", "", name)
  if (!grepl("^vld_[A-Za-z0-9._]+$", name)) {
    return(NULL)
  }
  chk_name <- sub("^vld_", "chk_", name)
  env <- environment(vld_fun)
  if (is.null(env)) {
    return(NULL)
  }
  if (!exists(chk_name, envir = env, mode = "function", inherits = TRUE)) {
    return(NULL)
  }
  get(chk_name, envir = env, mode = "function", inherits = TRUE)
}
