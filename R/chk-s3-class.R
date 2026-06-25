#' Check Type
#'
#' @description
#' Checks inherits from S3 class using
#'
#' `inherits(x, class) && !isS4(x) && !inherits(x, "R6")`
#'
#' @details
#' Note that [base objects](https://adv-r.hadley.nz/base-types.html) and S7
#' classes are considered S3 objects.
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family id_checkers
#'
#' @seealso [inherits()]
#' @seealso [typeof()]
#' @seealso For more details about the use of this function,
#' please read the article
#' `vignette("chk-families")`.
#'
#' @examples
#' # chk_s3_class
#' chk_s3_class(1, "numeric")
#' chk_s3_class(factor(1), "factor")
#' try(chk_s3_class(getClass("MethodDefinition"), "classRepresentation"))
#' @export
chk_s3_class <- function(x, class, x_name = NULL) {
  if (vld_s3_class(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(
    x_name,
    " must inherit from S3 class", if (length(class) == 1) " " else "es ",
    .class,
    ", not ",
    if (vld_s4_class(x, class(x))) "S4" else if (inherits(x, "R6")) "R6" else "S3",
    " class", if (length(class(x)) == 1) " " else "es ",
    cc(class(x), conj = " and "),
    ".",
    x = x,
    .class = .class
  )
}

#' @describeIn chk_s3_class Validate Inherits from S3 Class
#'
#' @examples
#' # vld_s3_class
#' vld_s3_class(numeric(0), "numeric")
#' vld_s3_class(getClass("MethodDefinition"), "classRepresentation")
#' @export
vld_s3_class <- function(x, class) {
  inherits(x, class) && # base objects and S7 classes count as S3
    !isS4(x) && # R5 classes count as S4
    !inherits(x, "R6")
}
