#' Check Equal
#'
#' @description
#' Checks if is equal (identical within tolerance) to y using
#'
#' `vld_true(all.equal(x, y, tolerance))`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_equals
#'
#' @examples
#' # chk_equal
#' chk_equal(1, 1.00000001)
#' try(chk_equal(1, 1.0000001))
#' chk_equal(1, 1L)
#' chk_equal(c(x = 1), c(x = 1L))
#' try(chk_equal(c(x = 1), c(y = 1L)))
#' @export
chk_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps),
                      x_name = NULL) {
  if (vld_equal(x, y, tolerance = tolerance)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y_name <- as_label(y)
  obj_of <- if (grepl("^<", y_name)) "the y object of class " else NULL
  abort_chk(x_name, " must be equal to ",
    obj_of, y_name,
    x = x, y = y
  )
}

#' @describeIn chk_equal Validate Equal
#'
#' @examples
#' vld_equal(1, 1.00000001)
#' @export
vld_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps)) {
  vld_true(all.equal(x, y, tolerance))
}
