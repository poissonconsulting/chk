#' Check Set
#'
#' @description
#' Checks whether the elements of an object match a set.
#'
#' Useful for checking names.
#'
#' @inheritParams params
#' @param set The set to check against.
#' @param exclusive A flag specifying whether x must only contain the elements of set.
#' @param order A flag specifying whether the order of elements in x must match those in set.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' check_set(1:2, 2:1)
#' try(check_set(1:2, 2:1, order = TRUE))
check_set <- function(x, set, exclusive = FALSE, order = FALSE, x_name = NULL) {
  chk_flag(exclusive)
  chk_flag(order)
  if(is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)

  if(exclusive) {
    if(order)
      return(chk_equivalent(x, set, x_name = x_name))
    return(chk_setequal(x, set, x_name = x_name))
  }
  chk_subset(x, set, x_name = x_name)
  if(!order) return(invisible())
  chk_setordered(x, set, x_name = x_name)
}
