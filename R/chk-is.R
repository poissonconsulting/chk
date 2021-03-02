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
#' @family chk_is
#'
#' @examples
#' chk_is(1, "numeric")
#' try(chk_is(1L, "double"))
#' @export
chk_is <- function(x, class, x_name = NULL) {
  if (vld_is(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_is(x, class, x_name)
}

#' @describeIn chk_is Check Inherits from Class
#'
#' @examples
#' check_is(1, "numeric")
#' try(check_is(1L, "double"))
#' @export
check_is <- function(x, class, x_name = NULL) {
  if (vld_is(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_is(x, class, x_name)
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

abort_is <- function(x, class, x_name) {
  abort_chk(x_name, " must inherit from class '", class, "'", x = x, class = class)
}
