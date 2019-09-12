#' Check/Validate TRUE, FALSE, Flag or Logical Scalar
#'
#' Checks/validates if TRUE, FALSE, a flag (TRUE or FALSE)
#' or a lgl (TRUE, FALSE, or NA).
#'
#' @param x The object to check.
#' @param x_name A string of the name of object x or NULL.
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_true
NULL

#' @describeIn chk_true Check TRUE
#'
#' Checks if TRUE using
#' \code{vld_true(x)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_true
#' chk_true(TRUE)
#' try(chk_true(1))
chk_true <- function(x, x_name = NULL) {
  if (vld_true(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be TRUE.")
}

#' @describeIn chk_true Validate TRUE
#'
#' Validates if TRUE using
#'
#' \code{\link{isTRUE}(x)}.
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
vld_true <- function(x) isTRUE(x)

#' @describeIn chk_true Check FALSE
#'
#' Checks if FALSE using
#' \code{vld_false(x)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_false
#' chk_false(FALSE)
#' try(chk_false(0))
chk_false <- function(x, x_name = NULL) {
  if (vld_false(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be FALSE.")
}

#' @describeIn chk_true Validate FALSE
#'
#' Validates if FALSE using
#'
#' \code{\link{isFALSE}(x)}.
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
vld_false <- function(x) isFALSE(x)

#' @describeIn chk_true Validate Flag
#'
#' Checks if non-missing logical scalar using
#' \code{vld_flag()}.
#'
#' @export
#'
#' @examples
#'
#' # vld_flag
#' chk_flag(TRUE)
#' try(vld_flag(1))
chk_flag <- function(x, x_name = NULL) {
  if (vld_flag(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must be a flag (TRUE or FALSE).")
}

#' @describeIn chk_true Validate Flag
#'
#' Validates if flag using
#'
#' \code{is.logical(x) && length(x) == 1L && !anyNA(x)}.
#'
#' @export
#'
#' @examples
#'
#' # vld_flag
#' vld_flag(TRUE)
#' vld_flag(FALSE)
#' vld_flag(NA)
#' vld_flag(1)
#' vld_flag(c(TRUE, TRUE))
vld_flag <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x)

#' @describeIn chk_true Check Logical Scalar
#'
#' Checks if logical scalar using
#' \code{vld_lgl(x)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_lgl
#' chk_lgl(NA)
#' try(chk_lgl(1))
chk_lgl <- function(x, x_name = NULL) {
  if (vld_lgl(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick((substitute(x)))
  abort_chk(x_name, " must be a logical scalar (TRUE, FALSE or NA).")
}

#' @describeIn chk_true Validate Logical Scalar
#'
#' Validates if logical scalar using
#'
#' \code{is.logical(x) && length(x) == 1L}.
#'
#' @export
#'
#' @examples
#'
#' # vld_lgl
#' vld_lgl(TRUE)
#' vld_lgl(FALSE)
#' vld_lgl(NA)
#' vld_lgl(1)
#' vld_lgl(c(TRUE, TRUE))
vld_lgl <- function(x) is.logical(x) && length(x) == 1L
