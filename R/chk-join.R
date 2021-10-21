#' Check Join
#'
#' @description
#' Checks if all rows in x match at least one in y.
#'
#' @inheritParams params
#' @param y A data.frame with columns in by.
#' @inherit params return
#'
#' @family chk_set
#'
#' @examples
#' # chk_join
#' chk_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
#' try(chk_join(data.frame(z = 1), data.frame(z = 2), by = "z"))
#' @export
chk_join <- function(x, y, by, x_name = NULL) {
  if (vld_join(x, y, by)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  y_name <- as_label(y)
  obj_of <- if(grepl("^<", y_name)) "the y object of class " else NULL
  abort_chk("All rows in ", x_name, " must match at least one in ",
    obj_of, y_name,
    x = x, y = y, by = by
  )
}

#' @describeIn chk_join Validate Join
#'
#' @examples
#' # vld_join
#' vld_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
#' vld_join(data.frame(z = 1), data.frame(z = 2), by = "z")
#' vld_join(data.frame(z = 1), data.frame(a = 1:2), by = c(z = "a"))
#' vld_join(data.frame(z = 1), data.frame(a = 2), by = c(z = "a"))
#' @export
vld_join <- function(x, y, by) {
  identical(
    nrow(x),
    nrow(merge(as.data.frame(x), unique(as.data.frame(y)[by]),
      by.x = if (is.null(names(by))) by else names(by), by.y = by
    ))
  )
}
