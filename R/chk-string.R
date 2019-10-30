#' Check/Validate String or Matches
#'
#' Checks/validates if string or matches a regular expression.
#'
#' @inheritParams chk_flag
#' @param regexp A string of a regular expression.
#' @return The `chk_` functions throw an informative error if the test fails.
#' The `vld_` functions return a flag indicating whether the test was met.
#' @name chk_string
NULL

#' @describeIn chk_string Check String
#'
#' Checks if non-missing character scalar using
#' `vld_string()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_string
#' chk_string("1")
#' try(chk_string(1))
chk_string <- function(x, x_name = NULL) {
  if(is.character(x) && length(x) == 1L && !anyNA(x)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must be a string (non-missing character scalar)")
}

#' @describeIn chk_string Validate String
#'
#' Validates non-missing character scalar using
#'
#' `is.character(x) && length(x) == 1L && !anyNA(x)`.
#'
#' @export
#'
#' @examples
#'
#' # vld_string
#' vld_string("1")
#' vld_string("")
#' vld_string(1)
#' vld_string(NA_character_)
#' vld_string(c("1", "1"))
vld_string <- function(x, x_name = NULL) {
  is.character(x) && length(x) == 1L && !anyNA(x)
}

#' @describeIn chk_string Check Matches
#'
#' Checks if all values match regular expression using
#' `vld_match()`.
#'
#' @export
#'
#' @examples
#'
#' # chk_match
#' chk_match("1")
#' try(chk_match("1", regexp = "2"))
chk_match <- function(x, regexp = ".+", x_name = NULL) {
  if(vld_match(x, regexp)) {
    return(invisible())
  }
  if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if(length(x) == 1L) {
    abort_chk(x_name, " must match regular expression '", regexp, "'")
  }
  abort_chk(x_name, " must have values matching regular expression '", regexp, "'")
}

#' @describeIn chk_string Validate Matches
#'
#' Validates all values match regular expression using
#'
#' `all(grepl(regexp, x))`.
#'
#' `regexp` should be a non-missing character scalar.
#'
#' @seealso [all()]
#' @seealso [grepl()]
#'
#' @export
#'
#' @examples
#'
#' # vld_match
#' vld_match("1")
#' vld_match("a", regexp = "a")
#' vld_match("")
#' vld_match("1", regexp = "2")
#' vld_match(NA_character_, regexp = ".*")
vld_match <- function(x, regexp = ".+") all(grepl(regexp, x[!is.na(x)]))
