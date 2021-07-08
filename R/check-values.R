#' Check Values and Class
#'
#' @description
#' Checks values and S3 class of an atomic object.
#'
#' @details
#' To check the class simply pass a vector of the desired class.
#'
#' To check that x does not include missing values pass
#' a single non-missing value (of the correct class).
#'
#' To allow it to include missing values include a missing value.
#'
#' To check that it only includes missing values only pass
#' a missing value (of the correct class).
#'
#' To check the range of the values in x pass two non-missing values
#' (as well as the missing value if required).
#'
#' To check that x only includes specific values
#' pass three or more non-missing values.
#'
#' In the case of a factor ensure values has two levels to
#' check that the levels of x are an ordered superset of the levels of value
#' and three or more levels to check that they are identical.
#'
#' @inheritParams params
#' @param values An atomic vector specifying the S3 class and possible values.
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @examples
#' check_values(1, numeric(0))
#' check_values(1, 2)
#' try(check_values(1, 1L))
#' try(check_values(NA_real_, 1))
#' @export
check_values <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_atomic(x, x_name = x_name)
  chk_vector(values)
  chk_atomic(values)

  class <- class(values)[1]
  chk_s3_class(x, class, x_name = x_name)
  if (is.factor(values) && nlevels(values) > 1) {
    x_name_levels <- backtick_chk(p0("levels(", unbacktick_chk(x_name), ")"))
    if (nlevels(values) > 2) {
      chk_identical(levels(x), levels(values), x_name = x_name_levels)
    } else {
      chk_superset(levels(x), levels(values), x_name = x_name_levels)
      chk_orderset(levels(x), levels(values), x_name = x_name_levels)
    }
  }
  if (!length(x) || !length(values)) {
    return(invisible(x))
  }
  if (vld_not_any_na(values)) chk_not_any_na(x, x_name = x_name)
  x <- x[!is.na(x)]
  values <- values[!is.na(values)]
  if (!length(x) || length(values) < 2) {
    return(invisible(x))
  }
  if (identical(length(values), 2L)) {
    values <- sort(unique(values))
    if (identical(length(values), 1L)) {
      return(chk_all(x, chk_equal, values, x_name = x_name))
    }
    if (is.factor(values) && (nlevels(values) < 3 || !is.ordered(values))) {
      return(invisible())
    }
    return(chk_range(x, values, x_name = x_name))
  }
  chk_subset(x, sort(unique(values)), x_name = x_name)
}
