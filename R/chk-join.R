#' Check Join
#'
#' @description
#' Checks if all rows in x match at least one in y using
#'
#' `identical(nrow(x), nrow(merge(x, unique(y[if (is.null(names(by))) by else names(by)]), by = by)))`
#'
#' @inheritParams params
#' @param y A data.frame with columns in by.
#' @return
#' The `chk_` function throws an informative error if the test fails.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @family chk_set
#' @export
#'
#' @examples
#'
#' chk_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
#' try(chk_join(data.frame(z = 1), data.frame(z = 2), by = "z"))
chk_join <- function(x, y, by, x_name = NULL) {
  if (vld_join(x, y, by)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y_name <- as_label(y)
  abort_chk("All rows in ", x_name, " must match at least one in: ",
            y_name, x = x, y = y, by = by)
}

#' @describeIn chk_join Validate Join
#'
#' @export
#'
#' @examples
#' vld_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
#' vld_join(data.frame(z = 1), data.frame(z = 2), by = "z")
#' vld_join(data.frame(z = 1), data.frame(a = 1:2), by = c(z = "a"))
#' vld_join(data.frame(z = 1), data.frame(a = 2), by = c(z = "a"))
vld_join <- function(x, y, by) {
  identical(
    nrow(x),
    nrow(merge(x, unique(y[by]),
               by.x = if(is.null(names(by))) by else names(by), by.y = by))
  )
}
