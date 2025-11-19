#' Check Data
#'
#' @description
#' Checks data.frame using
#'
#' `inherits(x, "data.frame")`
#'
#' Note that there is a similar function, [check_data()], which checks
#' the column names, values, number of rows, and keys of a data.frame.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family id_checkers
#'
#' @seealso [inherits()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_data
#' chk_data(data.frame(x = 1))
#' try(chk_data(1))
#' @export
chk_data <- function(x, x_name = NULL) {
  if (vld_data(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a data.frame", x = x)
}

#' @describeIn chk_data Validate Data
#'
#' @examples
#' # vld_data
#' vld_data(data.frame())
#' vld_data(data.frame(x = 1))
#' vld_data(c(x = 1))
#' @export
vld_data <- function(x) inherits(x, "data.frame")
