#' Check All Missing Values
#'
#' @description
#' Checks if all missing values using
#'
#' `all(is.na(x))`
#'
#' **Pass**: `NA`, `c(NA, NA)`, `logical(0)`.
#'
#' **Fail**: `1`, `1:2`, `"1"`, `c(1, NA)`.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family misc_checkers
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_all_na
#' try(chk_all_na(1))
#' try(chk_all_na(c(1, NA)))
#' chk_all_na(NA)
#' chk_all_na(c(NA, NA_character_, NA_real_))
#' @export
chk_all_na <- function(x, x_name = NULL) {
  if (vld_all_na(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk((substitute(x)))
  }
  abort_chk(x_name, " must only have missing values", x = x)
}

#' @describeIn chk_all_na Validate All Missing Values
#'
#' @examples
#' # vld_all_na
#' vld_all_na(1)
#' vld_all_na(1:2)
#' vld_all_na(NA_real_)
#' vld_all_na(integer(0))
#' vld_all_na(c(NA, 1))
#' vld_all_na(TRUE)
#' vld_all_na(c(NA_real_, NA_character_))
#' @export
vld_all_na <- function(x) all(is.na(x))
