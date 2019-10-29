#' Check All
#'
#' @description
#' Checks all elements using
#'
#' `all(vapply(x, chk_fun, TRUE, ...))`
#'
#' @inheritParams chk_flag
#' @inheritParams chk_unused
#' @inheritParams vld
#' @param chk_fun A chk_ function.
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_all
#' @export
#'
#' @examples
#'
#' # chk_all
#' chk_all(TRUE, chk_lgl)
#' # FIXME try(chk_all(1, chk_lgl))
#' chk_all(c(TRUE, NA), chk_lgl)
chk_all <- function(x, chk_fun, ..., x_name = NULL) {
  if(is.null(x)) {
    if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
    return(chk_fun(x, ..., x_name = x_name))
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  x_name <- paste0("all elements of ", x_name)

  args <- list(...)
  args$X <- x
  args$FUN <- chk_fun
  args$x_name <- x_name

  do.call("lapply", args)
  invisible()
}

#' @describeIn chk_all Validate All
#'
#' @export
#'
#' @examples
#'
#' # vld_all
#' vld_all(c(TRUE, NA), vld_lgl)
vld_all <- function(x, vld_fun, ...) {
  if(is.null(x)) {
    return(vld_fun(x, ...))
  }

  args <- list(...)
  args$X <- x
  args$FUN <- vld_fun
  args$FUN.VALUE <- TRUE

  all(do.call("vapply", args))
}
