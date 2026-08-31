#' Concatenate Strings
#'
#' A wrapper on [base::paste()].
#'
#' @inheritParams base::paste
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' p("a", "b")
#' p(c("a", "b"), collapse = " ")
#' p("a", character(0))
#' p("a", character(0), recycle0 = TRUE)
p <- function(..., sep = " ", collapse = NULL, recycle0 = FALSE) {
  paste(..., sep = sep, collapse = collapse, recycle0 = recycle0)
}

#' @describeIn p A wrapper on [base::paste0()]
#' @export
#'
#' @examples
#' p0("a", "b")
#' p0(c("a", "b"), collapse = "")
#' p0("a", character(0))
#' p0("a", character(0), recycle0 = TRUE)
p0 <- function(..., collapse = NULL, recycle0 = FALSE) {
  paste0(..., collapse = collapse, recycle0 = recycle0)
}
