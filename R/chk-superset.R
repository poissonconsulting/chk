#' Check Superset
#'
#' @description
#' Checks if includes all values using
#'
#' `all(values %in% x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_set
#'
#' @examples
#' # chk_superset
#' chk_superset(1:3, 1)
#' try(chk_superset(1:3, 4))
#' @export
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
#' @examples
#' # vld_superset
#' vld_superset(1:3, 1)
#' vld_superset(1:3, 4)
#' vld_superset(integer(0), integer(0))
#' @export
vld_superset <- function(x, values) all(values %in% x)
