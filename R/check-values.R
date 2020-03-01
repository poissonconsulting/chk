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
#' The only exception to the above is when values is
#' whole numeric vectors.
#' In this case the function checks that the values in x
#' are integers or whole numbers.
#' To check that the values in x are numeric values
#' ensure that values includes a fraction.
#'
#' @inheritParams params
#' @param values An atomic vector specifying the S3 class and possible values.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' check_values(1, numeric(0))
#' check_values(1, 2)
#' try(check_values(1, 1L))
#' try(check_values(NA_real_, 1))
check_values <- function(x, values, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_atomic(x, x_name = x_name)
  chk_vector(values)
  chk_atomic(values)

  if(vld_s3_class(values, "numeric") && vld_not_empty(values) &&
     all(!is.na(values)) && vld_whole_numeric(values)) {
    chk_whole_numeric(x, x_name = x_name)
  } else {
    class <- class(values)
    class <- class[length(class)]
    chk_s3_class(x, class, x_name = x_name)
  }
  if(!length(x) || !length(values)) return(invisible())
  if(vld_not_any_na(values)) chk_not_any_na(x, x_name = x_name)
  x <- x[!is.na(x)]
  values <- values[!is.na(values)]
  if(!length(x) || length(values) < 2) return(invisible())
  if(identical(length(values), 2L)) {
    values <- sort(unique(values))
    if(identical(length(values), 1L))
      return(chk_all(x, chk_equal, values, x_name = x_name))
    return(chk_range(x, values, x_name = x_name))
  }
  chk_subset(x, sort(unique(values)), x_name = x_name)
}
