#' Check/Validate NULL or not NULL
#'
#' Checks/validates if NULL or not NULL.
#'
#' @inheritParams chk_true
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_null
NULL

#' @describeIn chk_null Validate NULL
#'
#' Checks if NULL using
#' `vld_null()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_null
#' try(chk_null(1))
#' chk_null(NULL)
chk_null <- function(x, x_name = NULL) {
  if (vld_null(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be NULL")
}

#' @describeIn chk_null Validate NULL
#'
#' Validates if NULL using
#'
#' \code{is.null(x)}.
#'
#' @seealso [is.null()]
#'
#' @export
#'
#' @examples
#'
#' # vld_null
#' vld_null(NULL)
#' vld_null(1)
vld_null <- function(x) is.null(x)

#' @describeIn chk_null Check Not NULL
#'
#' Checks if not NULL using
#' `vld_not_null()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_not_null
#' try(chk_not_null(NULL))
#' chk_not_null(1)
chk_not_null <- function(x, x_name = NULL) {
  if (vld_not_null(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must not be NULL")
}

#' @describeIn chk_null Validate Not NULL
#'
#' Validates if not NULL using
#'
#' \code{!is.null(x)}.
#'
#' @export
#'
#' @examples
#'
#' # vld_not_null
#' vld_not_null(1)
#' vld_not_null(NULL)
vld_not_null <- function(x) !is.null(x)
