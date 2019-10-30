#' Check/Validate Superset and Subset
#'
#' Checks/validates if in and has values.
#'
#' @inheritParams chk_flag
#' @param values A vector of the permitted values.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_subset
NULL

#' @describeIn chk_subset Check In
#'
#' Checks if all values in values using `vld_subset()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_subset
#' chk_subset(1, 1:10)
#' try(chk_subset(11, 1:10))
chk_subset <- function(x, values, x_name = NULL) {
  if(vld_subset(x, values)) {
    return(invisible())
  }
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(x_name, " must match ", cc(values, " or "), ", not ", cc(x))
  }
  abort_chk(x_name, " must have values matching ", cc(values, " or "))
}

#' @describeIn chk_subset Validate In
#'
#' Validates all values in `values` using equivalent of
#'
#' `all(match(x, values, nomatch = 0) > 0)`
#'
#' @seealso [all()]
#' @seealso [match()]
#'
#' @export
#'
#' @examples
#'
#' # vld_subset
#' vld_subset(numeric(0), 1:10)
#' vld_subset(1, 1:10)
#' vld_subset(11, 1:10)
vld_subset <- function(x, values) all(x %in% values)

#' @describeIn chk_subset Check Has
#'
#' Checks if includes all values using `vld_superset()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_superset
#' chk_superset(1:3, 1)
#' try(chk_superset(1:3, 4))
chk_superset <- function(x, values, x_name = NULL) {
  if(vld_superset(x, values)) {
    return(invisible())
  }
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  values <- values[!values %in% x]
  abort_chk(x_name, " must include ", cc(values, " and "))
}

#' @describeIn chk_subset Validates Has
#'
#' Validates includes all values using
#'
#' `all(match(values, x, nomatch = 0) > 0)`
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
