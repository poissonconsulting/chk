#' Check All or Check All Identical, Equal or Equivalent
#'
#' @inheritParams chk_true
#' @inheritParams chk_unused
#' @inheritParams chk_identical
#' @param chk_fun A chk_ function.
#' @return \code{NULL}, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso \code{\link{chk_identical}()}.
#' @name chk_all
NULL

#' @describeIn chk_all Check All
#'
#' @description
#'
#' \code{chk_all()}
#' checks all elements using
#'
#' \code{all(vapply(x, chk_fun, TRUE, ...))}.
#'
#' @export
#'
#' @examples
#'
#' # chk_all
#' chk_all(TRUE, chk_lgl)
#' # FIXME try(chk_all(1, chk_lgl))
#' chk_all(c(TRUE, NA), chk_lgl)
chk_all <- function(x, chk_fun, ..., x_name = NULL) {
  if (is.null(x)) {
    if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
    return(chk_fun(x, ..., x_name = x_name))
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  x_name <- paste0("All elements of ", x_name)

  args <- list(...)
  args$X <- x
  args$FUN <- chk_fun
  args$x_name <- x_name

  do.call("lapply", args)
  invisible()
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_all(c(TRUE, NA), vld_lgl)
vld_all <- function(x, vld_fun, ...) {
  if (is.null(x)) {
    return(vld_fun(x, ...))
  }

  args <- list(...)
  args$X <- x
  args$FUN <- vld_fun
  args$FUN.VALUE <- TRUE

  all(do.call("vapply", args))
}

#' @describeIn chk_all Check All Identical
#'
#' @description
#'
#' \code{chk_all_identical()}
#' checks all elements in x identical using
#'
#' \code{all(vapply(x, chk_identical, TRUE, y = x[[1]]))}.
#'
#' \strong{Good}: \code{c(1, 1.00000001)}, \code{list(1, 1)}.
#'
#' \strong{Bad}: \code{c(1, 1.0000001)}, \code{list(1, NA)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_all_identical
#' chk_all_identical(c(1, 1))
#' try(chk_all_identical(c(1, 1.1)))
chk_all_identical <- function(x, x_name = NULL) {
  if (vld_all_identical(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must have identical elements.")
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_all_identical(c(1, 1))
vld_all_identical <- function(x) {
  length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))
}

#' @describeIn chk_all Check All Equal
#'
#'
#' @description
#'
#' \code{chk_all_equal()}
#' checks all elements in x equal using
#'
#' \code{all(vapply(x, chk_equal, TRUE, y = x[[1]]), tolerance = tolerance)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_all_equal
#' chk_all_equal(c(1, 1.00000001))
#' try(chk_all_equal(c(1, 1.0000001)))
#' chk_all_equal(list(c(x = 1), c(x = 1)))
#' try(chk_all_equal(list(c(x = 1), c(y = 1))))
chk_all_equal <- function(x, tolerance = sqrt(.Machine$double.eps), x_name = NULL) {
  if (vld_all_equal(x, tolerance = tolerance)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must have equal elements.")
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_all_equal(c(1, 1L))
vld_all_equal <- function(x, tolerance = sqrt(.Machine$double.eps)) {
  length(x) < 2L || all(vapply(x, vld_equal, TRUE, y = x[[1]], tolerance = tolerance))
}

#' @describeIn chk_all Check All Equivalent
#'
#'
#' @description
#'
#' \code{chk_all_equivalent()}
#' checks all elements in x equivalent using
#'
#' \code{all(vapply(x, chk_equivalent, TRUE, y = x[[1]]), tolerance = tolerance)}.
#'
#' @export
#'
#' @examples
#'
#' # chk_all_equivalent
#' chk_all_equivalent(c(1, 1.00000001))
#' try(chk_all_equivalent(c(1, 1.0000001)))
#' chk_all_equivalent(list(c(x = 1), c(x = 1)))
#' chk_all_equivalent(list(c(x = 1), c(y = 1)))
chk_all_equivalent <- function(x, tolerance = sqrt(.Machine$double.eps), x_name = NULL) {
  if (vld_all_equivalent(x, tolerance = tolerance)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))
  abort_chk(x_name, " must have equivalent elements.")
}

#' @export
#' @rdname vld
#'
#' @export
#'
#' @examples
#' vld_all_equivalent(c(x = 1, y = 1))
vld_all_equivalent <- function(x, tolerance = sqrt(.Machine$double.eps)) {
  length(x) < 2L || all(vapply(x, vld_equivalent, TRUE, y = x[[1]], tolerance = tolerance))
}
