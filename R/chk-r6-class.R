#' Check Inherits from R6 Class
#'
#' @description
#' Checks inherits from R6 class using
#'
#' `inherits(x, "R6") && inherits(x, class)`
#'
#' @details
#' All R6 objects inherit from the class `'R6'`, so `chk_r6_class(x, "R6")`
#' checks that `x` is an R6 object of any class.
#' R6 class generators (as returned by [R6::R6Class()]) are not themselves
#' R6 objects.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family id_checkers
#'
#' @seealso [inherits()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examplesIf requireNamespace("R6", quietly = TRUE)
#' # chk_r6_class
#' chk_r6_class(R6::R6Class("exampleR6class")$new(), "exampleR6class")
#' try(chk_r6_class(1, "numeric"))
#' @export
chk_r6_class <- function(x, class, x_name = NULL) {
  if (vld_r6_class(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(
    x_name,
    " must inherit from R6 class",
    if (length(class) == 1) " " else "es ",
    .class,
    ", not ",
    if (vld_s4_class(x, class(x))) {
      "S4"
    } else if (inherits(x, "R6")) {
      "R6"
    } else {
      "S3"
    },
    " class",
    if (length(class(x)) == 1) " " else "es ",
    cc(class(x), conj = " and "),
    ".",
    x = x,
    .class = .class
  )
}

#' @describeIn chk_r6_class Validate Inherits from R6 Class
#'
#' @examplesIf requireNamespace("R6", quietly = TRUE)
#' # vld_r6_class
#' vld_r6_class(R6::R6Class("exampleR6class")$new(), "exampleR6class")
#' vld_r6_class(1, "numeric")
#' @export
vld_r6_class <- function(x, class) inherits(x, "R6") && inherits(x, class)
