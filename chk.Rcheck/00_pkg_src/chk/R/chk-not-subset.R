#' Check Not Subset
#'
#' @description
#' Checks if not all values in values using
#'
#' `!any(x %in% values) || !length(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family set_checkers
#'
#' @seealso [any()]
#' @seealso [length()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_not_subset
#' chk_not_subset(11, 1:10)
#' try(chk_not_subset(1, 1:10))
#' @export
chk_not_subset <- function(x, values, x_name = NULL) {
  if (vld_not_subset(x, values)) {
    return(invisible(x))
  }
  values <- sort(unique(values), na.last = TRUE)
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  if (length(x) == 1L) {
    abort_chk(x_name, " must not match ", cc(unique(c(x, values)), " or "), x = x, values = values)
  }
  abort_chk(x_name, " must not have any values matching ", cc(values, " or "), x = x, values = values)
}

#' @describeIn chk_subset Validate Not Subset
#'
#' @examples
#' # vld_not_subset
#' vld_not_subset(numeric(0), 1:10)
#' vld_not_subset(1, 1:10)
#' vld_not_subset(11, 1:10)
#' @export
vld_not_subset <- function(x, values) !any(x %in% values) || !length(x)
