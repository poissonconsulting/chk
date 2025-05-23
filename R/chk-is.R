#' Check Class
#'
#' @description
#' Checks inherits from class using
#'
#' `inherits(x, class)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family id_checkers
#'
#' @seealso [inherits()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' chk_is(1, "numeric")
#' try(chk_is(1L, "double"))
#' @export
chk_is <- function(x, class, x_name = NULL) {
  if (vld_is(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(x_name, " must inherit from class ", .class, x = x, .class = .class)
}

#' @describeIn chk_is Validate Inherits from Class
#'
#' @examples
#'
#' # vld_is
#' vld_is(numeric(0), "numeric")
#' vld_is(1L, "double")
#' @export
vld_is <- function(x, class) {
  inherits(x, class)
}
