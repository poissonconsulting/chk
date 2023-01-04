#' Check Vectors Compatible Lengths
#'
#' Check vectors have the same length or are length one.
#'
#' @param ... The vectors to check the lengths of.
#'
#' @return The `chk_` function throws an informative error if the test fails.
#' @export
#' @details This function checks if the length of each vector is the same or
#'   if the length is one. This function helps to ensure you are not recycling
#'   values in the vector. For example the function will error if you
#'   had a vector of length 2 and length 4, even though the vector of length 2
#'   could be recycled to match up to the vector of length 4 when combined.
#'
#'   The intent of the function is to ensure when vectors are combined that the
#'   lengths are the same so the outputs do not have parts that are recycled
#'   except in the case of a single value which is a special case.
#'
#' @examples
#' # chk_
#' a <- c(1, 2, 3)
#' b <- c(1, 2, 3)
#' chk_lengths_into(a, b)
#'
#' hour <- c(7, 6, 8)
#' min <- c(30, 45, 30)
#' sec <- 0
#' chk_lengths_into(hour, min, sec)
#'
#' tag <- c(14, 16, 28, 42)
#' color_code <- c("G", "G" , "B", "B")
#' type <- "p"
#' chk_lengths_into(tag, color_code, type)
#'
chk_lengths_into <- function(...) {
  if (vld_lengths_into(...)) {
    return(invisible())
  }

  vec_lengths <-lengths(list(...))
  length_set <- unique(vec_lengths)

  abort_chk(
    "vectors must be all the same length or length 1 but not lengths ",
    cc(length_set, conj = " and ")
  )
}

#' @describeIn chk_lengths_into Check Vectors have the Same Length
#' @export
#' @examples
#' # vld_
#' a <- c(1, 2, 3)
#' b <- c(1, 2, 3)
#' vld_lengths_into(a, b)
#'
#' hour <- c(7, 6, 8)
#' min <- c(30, 45, 30)
#' sec <- 0
#' vld_lengths_into
vld_lengths_into <- function(...) {
  vec_lengths <- lengths(list(...))
  length_set <- unique(vec_lengths)

  if (length(length_set) == 1) {
    return(TRUE)
  }

  if (length(length_set) >= 3) {
    return(FALSE)
  }
  any(length_set == 1)
}
