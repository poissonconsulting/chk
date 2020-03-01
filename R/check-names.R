#' Check Names
#'
#' @description
#' Checks whether the names of an object.
#'
#' @inheritParams params
#' @param names A character vector of the permitted names.
#' @param exclusive A flag specifying whether x must only contain the permitted names.
#' @param order A flag specifying whether the order of the names in x must match the permitted names.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' x <- c(x = 1, y = 2)
#' check_names(x, c("y", "x"))
#' try(check_names(x, c("y", "x"), order = TRUE))
#' try(check_names(x, "x", exclusive = TRUE))
check_names <- function(x, names = character(0), exclusive = FALSE, order = FALSE,
                      x_name = NULL) {
  chk_s3_class(names, "character")
  chk_unique(names)
  chk_not_any_na(names)
  chk_flag(exclusive)
  chk_flag(order)
  if(is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_named(x, x_name = x_name)

  x_name <- backtick_chk(p0("names(", unbacktick_chk(x_name), ")"))

  if(exclusive) {
    if(order)
      return(chk_equivalent(names(x), names, x_name = x_name))
    return(chk_setequal(names(x), names, x_name = x_name))
  }
  chk_superset(names(x), names, x_name = x_name)
  if(!order) return(invisible())
  chk_setordered(names(x), names, x_name = x_name)
}
