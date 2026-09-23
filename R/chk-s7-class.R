#' Check Inherits from S7 Class
#'
#' @description
#' Checks inherits from S7 class using
#'
#' `inherits(x, "S7_object") && inherits(x, class)`
#'
#' @details
#' All S7 objects inherit from the class `'S7_object'`, so
#' `chk_s7_class(x, "S7_object")` checks that `x` is an S7 object of any class.
#'
#' S7 is self-describing, so an S7 class generator (as returned by
#' [S7::new_class()]) is itself an S7 object, of class `'S7_class'`.
#' It is not an object of the class it generates.
#'
#' `class` is a character vector of class names matching those in `class(x)`.
#' S7 qualifies class names with the package they are defined in, so an S7
#' class defined in package `foo` is matched by `'foo::ClassName'` and not by
#' `'ClassName'`.
#' S7 class objects are not accepted as `class`.
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
#' @examplesIf requireNamespace("S7", quietly = TRUE)
#' # chk_s7_class
#' Foo <- S7::new_class("Foo", package = "mypkg")
#' chk_s7_class(Foo(), "mypkg::Foo")
#' try(chk_s7_class(1, "numeric"))
#' @export
chk_s7_class <- function(x, class, x_name = NULL) {
  if (vld_s7_class(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(
    x_name,
    " must inherit from S7 class",
    if (length(class) == 1) " " else "es ",
    .class,
    ", not ",
    object_type(x),
    " class",
    if (length(class(x)) == 1) " " else "es ",
    cc(class(x), conj = " and "),
    ".",
    x = x,
    .class = .class
  )
}

#' @describeIn chk_s7_class Validate Inherits from S7 Class
#'
#' @examplesIf requireNamespace("S7", quietly = TRUE)
#' # vld_s7_class
#' Foo <- S7::new_class("Foo", package = "mypkg")
#' vld_s7_class(Foo(), "mypkg::Foo")
#' vld_s7_class(1, "numeric")
#' @export
vld_s7_class <- function(x, class) {
  inherits(x, "S7_object") && inherits(x, class)
}
