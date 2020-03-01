#' Check Data
#'
#' @description
#' Checks column names, values and nrow for a data.frame.
#'
#' @inheritParams params
#' @param values A uniquely named list of atomic vectors of the column values.
#' @param exclusive A flag specifying whether x must only include columns named in values.
#' @param order A flag specifying whether the order of elements in x must match those in values.
#' @param nrow A flag or a whole numeric vector of the value, value range or possible values.
#' @param key A character vector of the columns that represent a unique key.
#' @return An informative error if the test fails.
#' @family check
#' @export
check_data <- function(x, values = NULL, exclusive = FALSE, order = FALSE, nrow = numeric(0), key = character(0), x_name = NULL) {
  chk_s3_class(x, "data.frame")
  if(is.null(values)) values <- structure(list(), .Names = character(0))

  chk_list(values)
  chk_named(values)
  chk_unique(names(values))
  chk_all(values, chk_fun = chk_atomic)
  chk_flag(exclusive)
  chk_flag(order)
  chkor(chk_flag(nrow), chk_whole_numeric(nrow))
  chk_s3_class(key, "character")
  chk_unique(key)

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)

  check_dim(x, dim = base::nrow, values = nrow, x_name = x_name,
            dim_name = "nrow")
  check_names(x, names(values), exclusive = exclusive,
            order = order, x_name = x_name)
  lapply(names(values), function(name) {
    check_values(x[[name]], values[[name]], x_name = x_name)
  })
  chk_subset(key, names(x))
  chk_unique(x[key])
  invisible()
}
