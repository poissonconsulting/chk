#' Check/Validate TRUE, FALSE, Flag or Logical Scalar
#'
#' Checks/validates if TRUE, FALSE, a flag (TRUE or FALSE)
#' or a lgl (TRUE, FALSE, or NA).
#'
#' @param x The object to check.
#' @param x_name A string of the name of object x or NULL.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_true
NULL

#' @describeIn chk_true Check TRUE
#'
#' Checks if TRUE using
#' `vld_true(x)`.
#'
#' @export
#'
#' @examples
#'
#' # chk_true
#' chk_true(TRUE)
#' try(chk_true(1))
chk_true <- function(x, x_name = NULL) {
  if(vld_true(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be TRUE")
}

#' @describeIn chk_true Validate TRUE
#'
#' Validates if TRUE using
#'
#' `identical(unname(x), TRUE)`.
#'
#' @export
#'
#' @examples
#'
#' # vld_true
#' vld_true(TRUE)
#' vld_true(FALSE)
#' vld_true(NA)
#' vld_false(0)
#' vld_true(c(TRUE, TRUE))
vld_true <- function(x) identical(unname(x), TRUE)

#' @describeIn chk_true Check FALSE
#'
#' Checks if FALSE using
#' `vld_false(x)`.
#'
#' @export
#'
#' @examples
#'
#' # chk_false
#' chk_false(FALSE)
#' try(chk_false(0))
chk_false <- function(x, x_name = NULL) {
  if(vld_false(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be FALSE")
}

#' @describeIn chk_true Validate FALSE
#'
#' Validates if FALSE using
#'
#' `identical(unname(x), FALSE)`.
#'
#' @export
#'
#' @examples
#'
#' # vld_false
#' vld_false(TRUE)
#' vld_false(FALSE)
#' vld_false(NA)
#' vld_false(0)
#' vld_false(c(FALSE, FALSE))
vld_false <- function(x) identical(unname(x), FALSE)
