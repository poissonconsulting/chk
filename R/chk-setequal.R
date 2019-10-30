#' Check Set Equal
#'
#' @description
#' Checks if equal set using
#'
#' `setequal(x, values)`
#'
#' @param values A vector of the permitted values.
#' @inheritParams chk_flag
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
#' # chk_setequal
#' chk_setequal(1:2, 2:1)
#' try(chk_setequal(1, 1:2))
chk_setequal <- function(x, values, x_name = NULL) {
  if(vld_setequal(x, values)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must equal set: ", cc(values))
}

#' @describeIn chk_setequal Validate Set
#'
#' @export
#'
#' @examples
#'
#' # vld_setequal
#' vld_setequal(1, 1)
#' vld_setequal(1:2, 2:1)
#' vld_setequal(1, 2:1)
#' vld_setequal(1:2, 2)
vld_setequal <- function(x, values) setequal(x, values)
