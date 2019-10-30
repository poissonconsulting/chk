#' Check/Validate Unique
#'
#' Unique checks/validations.
#'
#' @inheritParams chk_flag
#' @param incomparables A vector of values that cannot be compared.
#' FALSE means that all values can be compared.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_unique
NULL

#' @describeIn chk_unique Check Unique
#'
#' Checks if unique using
#' `vld_unique()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_unique
#' chk_unique(c(NA, 2))
#' try(chk_unique(c(NA, NA, 2)))
#' chk_unique(c(NA, NA, 2), incomparables = NA)
chk_unique <- function(x, incomparables = FALSE, x_name = NULL) {
  if(vld_unique(x, incomparables = incomparables)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be unique")
}

#' @describeIn chk_unique Validate Unique
#'
#' Validates if unique using
#'
#' `!anyDuplicated(x, incomparables = incomparables)`.
#'
#' @seealso [anyDuplicated()]
#'
#' @export
#'
#' @examples
#'
#' # vld_unique
#' vld_unique(NULL)
#' vld_unique(numeric(0))
#' vld_unique(c(NA, 2))
#' vld_unique(c(NA, NA, 2))
#' vld_unique(c(NA, NA, 2), incomparables = NA)
vld_unique <- function(x, incomparables = FALSE) {
  !.anyDuplicated(x, incomparables = incomparables)
}

#' @describeIn chk_unique Check Named
#'
#' Checks if is named using
#' `vld_named()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_named
#' chk_named(c(x = 1))
#' try(chk_named(list(1)))
chk_named <- function(x, x_name = NULL) {
  if(vld_named(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be named")
}

#' @describeIn chk_unique Validate Named
#'
#' Checks if is named using
#'
#' `!is.null(names(x))`.
#'
#' @seealso [is.null()]
#' @seealso [names()]
#'
#' @export
#'
#' @examples
#'
#' # vld_named
#' vld_named(c(x = 1))
#' vld_named(list(x = 1))
#' vld_named(c(x = 1)[-1])
#' vld_named(list(x = 1)[-1])
#' vld_named(1)
#' vld_named(list(1))
vld_named <- function(x) !is.null(names(x))
