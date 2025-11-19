#' Expect Chk Error
#'
#' [expect_chk_error()] checks that code throws an error
#' of class `"chk_error"` with a message that matches regexp.
#' See below for more details.
#'
#' @inherit testthat::expect_error
#' @param class Must be NULL.
#' @export
#'
#' @examples
#' expect_chk_error(chk_true(FALSE))
#' try(expect_chk_error(chk_false(FALSE)))
expect_chk_error <- function(object, regexp = NULL, ..., info = NULL, label = NULL, class = NULL) {
  if (!is_installed("testthat")) {
    stop("`testhat` must be installed.")
  }
  if (!is.null(class)) stop("`class` must be NULL.")
  testthat::expect_error(object, regexp = regexp, class = "chk_error", ..., info = info, label = label)
}
