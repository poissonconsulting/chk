#' Check Type
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
#' # chk_class
#' chk_class(1, "numeric")
#' try(chk_class(getClass("MethodDefinition"), "classRepresentation"))
#' @export
chk_class <- function(x, class, x_name = NULL) {
  if (vld_class(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(
    x_name,
    " must inherit from class ",
    .class,
    x = x,
    .class = .class
  )
}

#' @describeIn chk_class Validate Inherits from Class
#'
#' @examples
#' # vld_class
#' vld_class(numeric(0), "numeric")
#' vld_class(getClass("MethodDefinition"), "classRepresentation")
#' @export
vld_class <- function(x, class) inherits(x, class)
