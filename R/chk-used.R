#' Check ... Used
#'
#' @description
#' Checks if is ... used using
#'
#' `length(list(...)) != 0L`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_ellipsis
#' @export
#'
#' @examples
#'
#' # chk_used
#' fun <- function(x, ...) {
#'   chk_used(...)
#'   x
#' }
#' try(fun(1))
#' fun(1, 2)
chk_used <- function(...) {
  if (vld_used(...)) {
    return(invisible())
  }
  abort_chk("`...` must be used")
}

#' @describeIn chk_used Validate ... Used
#'
#' @export
#'
#' @examples
#'
#' # vld_used
#' fun <- function(x, ...) {
#'   vld_used(...)
#' }
#' fun(1)
#' fun(1, 2)
vld_used <- function(...) length(list(...)) != 0L
