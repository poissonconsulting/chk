#' Check Not Empty
#'
#' @description
#' Checks if not empty using
#'
#' `length(x) != 0L`
#'
#' **Pass**: `1`, `1:2`, `NA`, `matrix(1:3)`, `list(1)`, `data.frame(x = 1)`.
#'
#' **Fail**: `NULL`, `logical(0)`, `list()`, `data.frame()`.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family misc_checkers
#'
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_not_empty
#' chk_not_empty(1)
#' try(chk_not_empty(numeric(0)))
#' @export
chk_not_empty <- function(x, x_name = NULL) {
  if (vld_not_empty(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must not be empty (zero length)", x = x)
}

#' @describeIn chk_not_empty Validate Not Empty
#'
#' @examples
#' # vld_not_empty
#' vld_not_empty(1)
#' vld_not_empty(matrix(1:3))
#' vld_not_empty(character(0))
#' vld_not_empty(list(1))
#' vld_not_empty(NULL)
#' vld_not_empty(list())
#' @export
vld_not_empty <- function(x) length(x) != 0L
