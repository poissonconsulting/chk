#' Check Matches
#'
#' @description
#' Checks if all values match regular expression using
#'
#' `all(grepl(regexp, x[!is.na(x)]))`
#'
#' @inheritParams params
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_misc
#' @export
#'
#' @examples
#'
#' # chk_match
#' chk_match("1")
#' try(chk_match("1", regexp = "2"))
chk_match <- function(x, regexp = ".+", x_name = NULL) {
  if (vld_match(x, regexp)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  if (length(x) == 1L) {
    abort_chk(x_name, " must match regular expression '", regexp, "'", x = x, regexp = regexp)
  }
  abort_chk(x_name, " must have values matching regular expression '", regexp, "'", x = x, regexp = regexp)
}

#' @describeIn chk_match Validate Matches
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
