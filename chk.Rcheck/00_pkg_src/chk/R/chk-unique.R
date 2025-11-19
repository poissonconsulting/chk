#' Check Unique
#'
#' @description
#' Checks if unique using
#'
#' `!anyDuplicated(x, incomparables = incomparables)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family misc_checkers
#'
#' @seealso [anyDuplicated()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_unique
#' chk_unique(c(NA, 2))
#' try(chk_unique(c(NA, NA, 2)))
#' chk_unique(c(NA, NA, 2), incomparables = NA)
#' @export
chk_unique <- function(x, incomparables = FALSE, x_name = NULL) {
  if (vld_unique(x, incomparables = incomparables)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be unique", x = x, incomparables = incomparables)
}

#' @describeIn chk_unique Validate Unique
#'
#' @examples
#' # vld_unique
#' vld_unique(NULL)
#' vld_unique(numeric(0))
#' vld_unique(c(NA, 2))
#' vld_unique(c(NA, NA, 2))
#' vld_unique(c(NA, NA, 2), incomparables = NA)
#' @export
vld_unique <- function(x, incomparables = FALSE) {
  !.anyDuplicated(x, incomparables = incomparables)
}
