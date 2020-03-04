#' Check Data
#'
#' @description
#' Checks column names, values, number of rows and key for a data.frame.
#'
#' @inheritParams params
#' @param values A uniquely named list of atomic vectors of the column values.
#' @return An informative error if the test fails.
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
check_data <- function(x, values = NULL, exclusive = FALSE, order = FALSE, nrow = numeric(0), key = character(0), x_name = NULL) {
  chk_data(x, "data.frame")

  if (is.null(values)) values <- structure(list(), .Names = character(0))
  chk_list(values)
  chk_named(values)
  chk_unique(names(values))
  chk_all(values, chk_fun = chk_atomic)

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)

  check_dim(x,
    dim = base::nrow, values = nrow, x_name = x_name,
    dim_name = "nrow"
  )
  check_names(x,
    names = names(values), exclusive = exclusive,
    order = order, x_name = x_name
  )
  lapply(names(values), function(name) {
    check_values(x[[name]], values[[name]],
      x_name = backtick_chk(p0(unbacktick_chk(x_name), "$", name))
    )
  })
  check_key(x, key = key, x_name = x_name)
  invisible()
}
