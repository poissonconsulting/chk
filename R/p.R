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
p <- function(..., sep = " ", collapse = NULL)
  paste(..., sep = sep, collapse = collapse)

#' @describeIn p A wrapper on [base::paste0()]
#' @export
#'
#' @examples
#' p0("a", "b")
#' p0(c("a", "b"), collapse = "")
p0 <- function(..., collapse = NULL)
  paste0(..., collapse = collapse)
