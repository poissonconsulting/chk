#' Check Length
#'
#' @description
#' Checks length of an object.
#'
#' @inheritParams params
#' @param length A flag or a whole numeric vector of the length, length range or possible values.
#' @return An informative error if the test fails.
#' @family check
#' @export
#' @examples
#' check_length(1)
#' try(check_length(1, length = FALSE))
#' try(check_length(1, length = c(10, 2)))
#' try(check_length(1, length = c(10, 2, 10)))
check_length <- function(x, length = TRUE, x_name = NULL) {
  chkor(chk_flag(length), chk_whole_numeric(length))
  chk_not_empty(length)
  chkor(is.null(x_name), chk_string(x_name))

  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  x_name <- p0("`length(", unbacktick_chk(x_name), ")`")

  if(vld_true(length)) return(chk_gt(length(x), x_name = x_name))
  if(vld_false(length)) length <- 0L
  if(identical(length(length), 2L)) {
    if(!identical(length[1], length[2]))
      return(chk_range(length(x), sort(length), x_name = x_name))
    length <- unique(length)
  }
  if(identical(length(length), 1L))
    return(chk_equal(length(x), length, x_name = x_name))
  chk_subset(length(x), sort(unique(length)), x_name = x_name)
}
