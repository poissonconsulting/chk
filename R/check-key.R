#' Check Key
#'
#' @description
#' Checks if columns have unique rows.
#'
#' @inheritParams params
#' @param key A character vector of the columns that represent a unique key.
#' @param na_distinct A flag specifying whether missing values should be considerd distinct.
#' @return An informative error if the test fails.
#'
#' @family check
#'
#' @examples
#' x <- data.frame(x = c(1, 2), y = c(1, 1))
#' check_key(x)
#' try(check_key(x, "y"))
#' @export
check_key <- function(x, key = character(0), na_distinct = FALSE, x_name = NULL) {
  chk_data(x)
  chk_s3_class(key, "character")
  chk_unique(key)
  chk_not_any_na(key)
  chk_flag(na_distinct)

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)

  check_names(x, key, x_name = x_name)

  incomparables <- if (na_distinct) NA else FALSE
  if (any(new_duplicated(x[key], incomparables = incomparables))) {
    abort_chk("Column%s ", cc(key, conj = " and "), " in ", x_name, " must be a unique key.", n = length(key))
  }
  invisible()
}
