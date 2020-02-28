#' Check Dimension
#'
#' @description
#' Checks dimension of an object.
#'
#' @inheritParams params
#' @param dim A function returning a non-negative scalar integer of the dimension.
#' @param values A flag or a whole numeric vector of the value, value range or possible values.
#' @param dim_name A string of the name of the dim function.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' check_length(1)
#' try(check_length(1, values = FALSE))
#' try(check_length(1, values = c(10, 2)))
#' try(check_length(1, values = c(10, 2, 10)))
check_length <- function(x, dim = length, values = TRUE, x_name = NULL, dim_name = NULL) {
  chk_function(dim)
  chkor(chk_flag(values), chk_whole_numeric(values))
  chk_not_empty(values)

  if (is.null(x_name)) x_name <- deparse((substitute(x)))
  chk_string(x_name)
  if (is.null(dim_name)) dim_name <- deparse((substitute(dim)))
  chk_string(dim_name)

  x_name <- backtick_chk(p0(dim_name, "(", x_name, ")"))

  if(vld_true(values)) return(chk_gt(dim(x), x_name = x_name))
  if(vld_false(values)) values <- 0L
  if(identical(length(values), 2L)) {
    if(!identical(values[1], values[2]))
      return(chk_range(dim(x), sort(values), x_name = x_name))
    values <- unique(values)
  }
  if(identical(length(values), 1L))
    return(chk_equal(dim(x), values, x_name = x_name))
  chk_subset(dim(x), sort(unique(values)), x_name = x_name)
}
