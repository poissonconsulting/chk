#' Expect Chk Error
#'
#' [expect_chk_error()] checks that code throws an error
#' of class `"chk_error"` with a message that matches regexp.
#' See below for more details.
#'
#' @inherit testthat::expect_error
#' @param class Must be `"chk_error"`.
#' @export
#'
#' @examples
#' expect_chk_error(chk_true(FALSE))
#' try(expect_chk_error(chk_false(FALSE)))
expect_chk_error <- function(object, regexp = NULL, class = "chk_error", ..., info = NULL, label = NULL) {
  if(!requireNamespace("testthat", quietly = TRUE))
    stop("`testhat` must be installed.")
  if(!missing(class)) stop("`class` must be missing.")
  testthat::expect_error(object, regexp = regexp, class = class, ..., info = info, label = label)
}
