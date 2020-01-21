#' Check ... Unused
#'
#' @description
#' Checks if ... is unused
#'
#' `length(list(...)) == 0L`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_ellipsis
#' @export
#'
#' @examples
#'
#' # chk_unused
#' fun <- function(x, ...) {
#'   chk_unused(...)
#'   x
#' }
#' fun(1)
#' try(fun(1, 2))
chk_unused <- function(...) {
  if (!length(list(...))) {
    return(invisible())
  }
  abort_chk("`...` must be unused")
}

#' @describeIn chk_unused Validate ... Unused
#'
#' @export
#'
#' @examples
#'
#' # vld_unused
#' fun <- function(x, ...) {
#'   vld_unused(...)
#' }
#' fun(1)
#' try(fun(1, 2))
vld_unused <- function(...) length(list(...)) == 0L

#' @describeIn chk_unused Check ... Used
#'
#' Checks if is ... used using
#' `vld_unused()`.
#'
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

#' @describeIn chk_unused Validate ... Used
#'
#' Validates if ... used using
#'
#' `length(list(...)) != 0L`.
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
