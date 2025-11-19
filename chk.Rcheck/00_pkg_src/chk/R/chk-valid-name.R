#' Check Valid Name
#'
#' @description
#' Checks if valid name using
#'
#' `identical(make.names(x[!is.na(x)]), as.character(x[!is.na(x)]))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family name_checkers
#'
#' @seealso [identical()]
#' @seealso [make.names()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_valid_name
#' chk_valid_name("text")
#' try(chk_valid_name(".1"))
#' @export
chk_valid_name <- function(x, x_name = NULL) {
  if (vld_valid_name(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be valid name%s", n = length(x))
}

#' @describeIn chk_valid_name Validate Valid Name
#'
#' @examples
#' # vld_valid_name
#' vld_valid_name(".1")
#' @export
vld_valid_name <- function(x) identical(make.names(x[!is.na(x)]), as.character(x[!is.na(x)]))
