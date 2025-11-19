#' Check Environment
#'
#' @description
#' Checks if environment using
#'
#' `is.environment(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_type_checkers
#'
#' @seealso [is.environment()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_environment
#' chk_environment(.GlobalEnv)
#' try(chk_environment(1))
#' @export
chk_environment <- function(x, x_name = NULL) {
  if (vld_environment(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be an environment", x = x)
}

#' @describeIn chk_environment Validate Environment
#'
#' @examples
#' # vld_environment
#' vld_environment(1)
#' vld_environment(list(1))
#' vld_environment(.GlobalEnv)
#' vld_environment(environment())
#' @export
vld_environment <- function(x) is.environment(x)
