#' Check Dimension
#'
#' @description
#' Checks dimension of an object.
#'
#' @inheritParams params
#' @param dim A function returning a non-negative whole number of the dimension.
#' @param values A flag or a whole numeric vector of the value, value range or possible values.
#' @param dim_name A string of the name of the dim function.
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @examples
#' check_dim(1)
#' try(check_dim(1, values = FALSE))
#' try(check_dim(1, values = c(10, 2)))
#' try(check_dim(data.frame(x = 1), dim = nrow, values = c(10, 10, 2)))
#' @export
check_dim <- function(x, dim = length, values = numeric(0), x_name = NULL, dim_name = NULL) {
  chk_function(dim)
  if(!vld_flag(values) & !vld_whole_numeric(values)) {
    chkor_vld(vld_flag(values), vld_whole_numeric(values))
  }
  chk_whole_number(dim(x))
  chk_gte(dim(x))

  if (is.null(x_name)) x_name <- deparse((substitute(x)))
  chk_string(x_name)
  if (is.null(dim_name)) dim_name <- deparse((substitute(dim)))
  chk_string(dim_name)

  x_name <- backtick_chk(p0(dim_name, "(", x_name, ")"))

  if (!length(values)) {
    return(invisible(x))
  }

  if (vld_true(values)) {
    return(chk_gt(dim(x), x_name = x_name))
  }
  if (vld_false(values)) values <- 0L
  if (identical(length(values), 2L)) {
    if (!identical(values[1], values[2])) {
      return(chk_range(dim(x), sort(values), x_name = x_name))
    }
    values <- unique(values)
  }
  if (identical(length(values), 1L)) {
    return(chk_equal(dim(x), values, x_name = x_name))
  }
  chk_subset(dim(x), sort(unique(values)), x_name = x_name)
}
