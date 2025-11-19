#' Check Length
#'
#' @description
#' Checks length of an object.
#'
#' @inheritParams params
#' @param values A flag or a whole numeric vector of the value, value range or possible values.
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @examples
#' check_length(1)
#' try(check_length(1, values = FALSE))
#' try(check_length(1, values = c(10, 2)))
#' @export
check_length <- function(x, values = numeric(0), x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse((substitute(x)))
  check_dim(x, values = values, x_name = x_name, dim_name = "length")
}
