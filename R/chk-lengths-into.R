#' Check Compatible Lengths
#'
#' Checks objects (including vectors) have lengths that could be 'strictly recycled'.
#' That is to say they must all be either zero length or the same length
#' with some of length 1.
#'
#' @inheritParams params
#' @param ... The objects to check for compatible lengths.
#' @return The `chk_` function throws an informative error if the test fails.
#' @details This function helps to check vectors could be 'strictly recycled.'
#'   For example the function will error if you
#'   had a vector of length 2 and length 4, even though the vector of length 2
#'   could be 'loosely recycled' to match up to the vector of length 4 when combined.
#'
#'   The intent of the function is to check that only strict recycling is occurring.
#'
#' @examples
#' # chk_lengths_into
#'
#' a <- integer(0)
#' b <- numeric(0)
#' chk_lengths_into(a, b)
#'
#' a <- 1
#' b <- 2
#' chk_lengths_into(a, b)
#'
#' a <- 1:3
#' b <- 1:3
#' chk_lengths_into(a, b)
#'
#' b <- 1
#' chk_lengths_into(a, b)
#'
#' b <- 1:2
#' try(chk_lengths_into(a, b))
#'
#' b <- 1:6
#' try(chk_lengths_into(a, b))
#' @export
chk_lengths_into <- function(..., x_name = NULL) {
  if (vld_lengths_into(...)) {
    return(invisible())
  }

  if (is.null(x_name)) x_name <- "... objects"
  chk_string(x_name)

  vec_lengths <- lengths(list(...))
  length_set <- sort(unique(vec_lengths))

  abort_chk(
    x_name, " must be all zero length or the same length with some of length of 1 but not lengths ",
    cc(length_set, conj = " and ")
  )
}

#' @describeIn chk_lengths_into Validate Compatible Lengths
#' @export
#' @examples
#' # vld_length_into
#'
#' a <- integer(0)
#' b <- numeric(0)
#' vld_lengths_into(a, b)
#'
#' a <- 1
#' b <- 2
#' vld_lengths_into(a, b)
#'
#' a <- 1:3
#' b <- 1:3
#' vld_lengths_into(a, b)
#'
#' b <- 1
#' vld_lengths_into(a, b)
#'
#' b <- 1:2
#' vld_lengths_into(a, b)
#'
#' b <- 1:6
#' vld_lengths_into(a, b)
vld_lengths_into <- function(...) {
  vec_lengths <- lengths(list(...))
  length_set <- unique(vec_lengths)

  if (length(length_set) <= 1) {
    return(TRUE)
  }
  if (length(length_set) >= 3) {
    return(FALSE)
  }
  min(length_set) == 1
}
