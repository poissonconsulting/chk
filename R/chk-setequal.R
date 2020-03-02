#' Check Set Equal
#'
#' @description
#' Checks if equal set using
#'
#' `setequal(x, values)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_set
#'
#' @examples
#' # chk_setequal
#' chk_setequal(1:2, 2:1)
#' try(chk_setequal(1, 1:2))
#' @export
chk_setequal <- function(x, values, x_name = NULL) {
  if (vld_setequal(x, values)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must equal set: ", cc(values), x = x, values = values)
}

#' @describeIn chk_setequal Validate Set Equal
#'
#' @examples
#' # vld_setequal
#' vld_setequal(1, 1)
#' vld_setequal(1:2, 2:1)
#' vld_setequal(1, 2:1)
#' vld_setequal(1:2, 2)
#' @export
vld_setequal <- function(x, values) setequal(x, values)
