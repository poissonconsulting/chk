#' Check Names
#'
#' @description
#' Checks the names of an object.
#'
#' @inheritParams params
#' @param names A character vector of the required names.
#' @param exclusive A flag specifying whether x must only contain the required names.
#' @param order A flag specifying whether the order of the required names in x must match the order in names.
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @examples
#' x <- c(x = 1, y = 2)
#' check_names(x, c("y", "x"))
#' try(check_names(x, c("y", "x"), order = TRUE))
#' try(check_names(x, "x", exclusive = TRUE))
#' @export
check_names <- function(x, names = character(0), exclusive = FALSE, order = FALSE,
                        x_name = NULL) {
  chk_s3_class(names, "character")
  chk_unique(names)
  chk_not_any_na(names)
  chk_flag(exclusive)
  chk_flag(order)
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_named(x, x_name = x_name)

  x_names <- names(x)

  if (!length(names)) {
    if (exclusive && length(x_names)) {
      abort_chk(x_name, " must not have any elements")
    }
    return(invisible(x))
  }

  x_name <- backtick_chk(p0("names(", unbacktick_chk(x_name), ")"))

  if (length(setdiff(names, x_names))) {
    abort_chk(x_name, " must include ", cc(setdiff(names, x_names), conj = " and "))
  }

  if (exclusive && length(setdiff(x_names, names))) {
    abort_chk(x_name, " must not include ", cc(setdiff(x_names, names), conj = " or "))
  }

  if (order && !identical(intersect(names, x_names), intersect(x_names, names))) {
    abort_chk(x_name, " must include ", cc(names, conj = " and "), " in that order")
  }
  invisible(x)
}
