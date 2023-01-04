#' Check Vectors have the Same Length
#'
#' To combine vectors they either need to all be the same length or be of length
#' one. If they are length one then the value will be recycled in the longer
#' vectors.
#'
#' @param ... The vectors to check the lengths of.
#'
#' @return The `chk_` function throws an informative error if the test fails.
#' @export
#'
#' @examples
#' a <- c(1, 2, 3)
#' b <- c(1, 2, 3)
#' chk_vector_lengths(a, b)
#'
#' hour <- c(7, 6, 8)
#' min <- c(30, 45, 30)
#' sec <- 0
#' chk_vector_lengths(hour, min, sec)
chk_vector_lengths <- function(...) {
  if (vld_vector_lengths(...)) {
    return(invisible())
  }

  vec_lengths <- vapply(list(...), length, FUN.VALUE = 1)
  length_set <- unique(vec_lengths)

  abort_chk(
    "vectors must be all the same length or length 1 but not lengths ",
    cc(length_set, conj = " and ")
  )
}

#' @describeIn chk_vector_lengths Check Vectors have the Same Length
#' @export
#' @examples
#' a <- c(1, 2, 3)
#' b <- c(1, 2, 3)
#' vld_vector_lengths(a, b)
#'
#' hour <- c(7, 6, 8)
#' min <- c(30, 45, 30)
#' sec <- 0
#' vld_vector_lengths
vld_vector_lengths <- function(...) {
  vec_lengths <- vapply(list(...), length, FUN.VALUE = 1)
  length_set <- unique(vec_lengths)

  if (length(length_set) == 1) {
    return(TRUE)
  }

  if (length(length_set) >= 3) {
    return(FALSE)
  }
  any(length_set == 1)
}
