#' Check Superset
#'
#' @description
#' Checks if includes all values using
#'
#' `all(values %in% x)`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_set
#' @export
#'
#' @examples
#'
#' # chk_superset
#' chk_superset(1:3, 1)
#' try(chk_superset(1:3, 4))
chk_superset <- function(x, values, x_name = NULL) {
  if (vld_superset(x, values)) {
    return(invisible())
  }
  values <- sort(unique(values), na.last = TRUE)
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  values <- values[!values %in% x]
  abort_chk(x_name, " must include ", cc(values, " and "), x = x, values = values)
}

#' @describeIn chk_superset Validates Superset
#'
#' @export
#'
#' @examples
#'
#' # vld_superset
#' vld_superset(1:3, 1)
#' vld_superset(1:3, 4)
#' vld_superset(integer(0), integer(0))
vld_superset <- function(x, values) all(values %in% x)
