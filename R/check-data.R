#' Check Data
#'
#' @description
#' Checks column names, values, number of rows and key for a data.frame.
#'
#' @details
#' The values of each column are checked using [check_values()].
#' See its details for the rules including those for factor levels
#' and missing values.
#'
#' `values` is reduced with [unique()],
#' so a column whose class lacks a correct [unique()] method
#' is checked against the wrong values.
#' In particular [unique()] on a `lubridate` `Period` vector discards
#' everything but the seconds,
#' which collapses `values` and silently changes the check applied
#' (see <https://github.com/tidyverse/lubridate/issues/1154>).
#' Either define `unique.Period()` in your own code
#' or convert the column and `values` to a class with a correct
#' [unique()] method,
#' such as the number of seconds with `as.numeric(lubridate::as.duration(x))`.
#'
#' @inheritParams params
#' @param values A uniquely named list of atomic vectors of the column values.
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @export
#' @examples
#' check_data(data.frame())
#' check_data(data.frame(x = 2), list(x = 1))
#' try(check_data(data.frame(x = 2), list(y = 1L)))
#' try(check_data(data.frame(x = 2), list(y = 1)))
#' try(check_data(data.frame(x = 2), nrow = 2))
check_data <- function(
  x,
  values = NULL,
  exclusive = FALSE,
  order = FALSE,
  nrow = numeric(0),
  key = character(0),
  x_name = NULL
) {
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  chk_data(x, x_name = x_name)

  if (is.null(values)) {
    values <- structure(list(), names = character(0))
  }
  chk_list(values)
  chk_named(values)
  chk_unique(names(values))
  chk_all(values, chk_fun = chk_atomic)

  check_dim(
    x,
    dim = base::nrow,
    values = nrow,
    x_name = x_name,
    dim_name = "nrow"
  )
  check_names(
    x,
    names = names(values),
    exclusive = exclusive,
    order = order,
    x_name = x_name
  )
  lapply(names(values), function(name) {
    check_values(
      x[[name]],
      values[[name]],
      x_name = backtick_chk(p0(unbacktick_chk(x_name), "$", name))
    )
  })
  check_key(x, key = key, x_name = x_name)
  invisible(x)
}
