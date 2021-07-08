#' Check Set Ordered
#'
#' @description
#' Checks if the first occurrence of each shared element
#' in x is equivalent to the first occurrence of each shared element in values using
#' `vld_equivalent(unique(x[x %in% values]), values[values %in% x])`.
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
#' # chk_orderset
#' chk_orderset(1:2, 1:2)
#' try(chk_orderset(2:1, 1:2))
chk_orderset <- function(x, values, x_name = NULL) {
  if (vld_orderset(x, values)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  values <- values[values %in% x]
  abort_chk(x_name, " must have (the first occurence of) each of the following elements in the following order: ", cc(values), x = x, values = values)
}

#' @describeIn chk_setequal Validate Set Ordered
#'
#' @export
#'
#' @examples
#'
#' # vld_orderset
#' vld_orderset(1, 1)
#' vld_orderset(1:2, 2:1)
#' vld_orderset(1, 2:1)
#' vld_orderset(1:2, 2)
vld_orderset <- function(x, values) {
  vld_equivalent(unique(x[x %in% values]), values[values %in% x])
}
