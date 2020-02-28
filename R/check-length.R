#' Check Length
#'
#' @description
#' Checks length of an object.
#'
#' @inheritParams params
#' @param values A flag or a whole numeric vector of the value, value range or possible values.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' check_length(1)
#' try(check_length(1, values = FALSE))
#' try(check_length(1, values = c(10, 2)))
#' try(check_length(1, values = c(10, 2, 10)))
check_length <- function(x, values = TRUE, x_name = NULL) {
  chkor(chk_flag(values), chk_whole_numeric(values))
  chk_not_empty(values)
  chkor(is.null(x_name), chk_string(x_name))

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  x_name <- p0("`length(", unbacktick_chk(x_name), ")`")

  if(vld_true(values)) return(chk_gt(length(x), x_name = x_name))
  if(vld_false(values)) values <- 0L
  if(identical(length(values), 2L)) {
    if(!identical(values[1], values[2]))
      return(chk_range(length(x), sort(values), x_name = x_name))
    values <- unique(values)
  }
  if(identical(length(values), 1L))
    return(chk_equal(length(x), values, x_name = x_name))
  chk_subset(length(x), sort(unique(values)), x_name = x_name)
}
