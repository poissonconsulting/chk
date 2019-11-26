#' Check Subset
#'
#' @description
#' Checks if all values in values using
#'
#' `all(x %in% values)`
#'
#' @inheritParams params
#' @return
#' The `chk_` functions throw an informative error if the test fails.
#'
#' The `vld_` functions return a flag indicating whether the test was met.
#'
#' @family chk_set
#' @export
#'
#' @examples
#'
#' # chk_subset
#' chk_subset(1, 1:10)
#' try(chk_subset(11, 1:10))
chk_subset <- function(x, values, x_name = NULL) {
  if (vld_subset(x, values)) {
    return(invisible())
  }
  values <- sort(unique(values), na.last = TRUE)
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(x_name, " must match ", cc(values, " or "), ", not ", cc(x))
  }
  abort_chk(x_name, " must have values matching ", cc(values, " or "))
}

#' @describeIn chk_subset Validate Subset
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
