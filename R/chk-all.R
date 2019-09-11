#' Check/Validate All or All Identical
#' 
#' Checks/validates all elements or all elements identical.
#' 
#' @inheritParams chk_true
#' @inheritParams chk_unused
#' @param chk_fun A chk_ function.
#' @param vld_fun A vld_ function.
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_all
NULL

#' @describeIn chk_all Check All
#' 
#' Checks all elements using \code{all(vapply(x, chk_fun, TRUE, ...))}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_all
#' chk_all(TRUE, chk_lgl)
#' try(chk_all(1, chk_lgl))
chk_all <- function(x, chk_fun, ..., x_name = NULL) {
  if(is.null(x)) {
    if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
    return(chk_fun(x, ..., x_name = x_name))
  }
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  x_name <- paste0("All elements of ", x_name)

  args <- list(...)
  args$X <- x
  args$FUN <- chk_fun
  args$x_name <- x_name

  do.call("lapply", args)
  invisible()
}

#' @describeIn chk_all Validate All
#' 
#' Validates all elements using \code{all(vapply(x, vld_fun, TRUE, ...))}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_all
#' vld_all(TRUE, vld_lgl)
#' vld_all(c(TRUE, NA), vld_lgl)
#' vld_all(numeric(0), vld_lgl)
#' vld_all(1, vld_lgl)
vld_all <- function(x, vld_fun, ...) {
  if(is.null(x)) return(vld_fun(x, ...))
  
  args <- list(...)
  args$X <- x
  args$FUN <- vld_fun
  args$FUN.VALUE <- TRUE

  all(do.call("vapply", args))
}

#' @describeIn chk_all Check All Identical
#' 
#' Checks all elements in x identical using \code{vld_all_identical()}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_all_identical
#' chk_all_identical(1, 1.00000001)
#' try(chk_all_identical(1, 1.0000001))
chk_all_identical <- function(x, x_name = NULL) {
  if(vld_all_identical(x)) return(invisible())
  if(is.null(x_name))  x_name <- tick(deparse(substitute(x)))
  .abort(x_name, " must have identical elements.")
}

#' @describeIn chk_all Validates All Identical
#' 
#' Validates all elements in x identical using \code{all(vapply(x, identical, TRUE, y = x[[1]]))}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_all_identical
#' vld_all_identical(c(1, 1.00000001))
#' vld_all_identical(c(1, 1.0000001))
#' vld_all_identical(c(1, 1L))
#' vld_all_identical(c(1,2))
#' vld_all_identical(c(1,2.0000001))
vld_all_identical <- function(x) {
  length(x) < 2L || all(vapply(x, vld_identical, TRUE, y = x[[1]]))
}
