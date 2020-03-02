#' Check ... Unused
#'
#' @description
#' Checks if ... is unused
#'
#' `length(list(...)) == 0L`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_ellipsis
#'
#' @examples
#' # chk_unused
#' fun <- function(x, ...) {
#'   chk_unused(...)
#'   x
#' }
#' fun(1)
#' try(fun(1, 2))
#' @export
chk_unused <- function(...) {
  if (!length(list(...))) {
    return(invisible())
  }
  abort_chk("`...` must be unused")
}

#' @describeIn chk_unused Validate ... Unused
#'
#' @examples
#' # vld_unused
#' fun <- function(x, ...) {
#'   vld_unused(...)
#' }
#' fun(1)
#' try(fun(1, 2))
#' @export
vld_unused <- function(...) length(list(...)) == 0L
