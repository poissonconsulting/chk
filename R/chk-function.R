#' Check Function
#'
#' @description
#' Checks if is a function using
#'
#' `is.function(x) && (is.null(formals) || length(formals(x)) == formals)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_is
#'
#' @examples
#' # chk_function
#' chk_function(mean)
#' try(chk_function(1))
#' @export
chk_function <- function(x, formals = NULL, x_name = NULL) {
  if (vld_function(x, formals)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (!is.function(x)) abort_chk(x_name, " must be a function", x = x, formals = formals)
  abort_chk(x_name, " must have ", formals, " formal arguments (not ", length(formals(x)), ")", x = x, formals = formals)
}

#' @describeIn chk_function Validate Function
#'
#' @examples
#' # vld_function
#' vld_function(mean)
#' vld_function(function(x) x)
#' vld_function(1)
#' vld_function(list(1))
#' @export
vld_function <- function(x, formals = NULL) {
  is.function(x) && (is.null(formals) || length(formals(x)) == formals)
}
