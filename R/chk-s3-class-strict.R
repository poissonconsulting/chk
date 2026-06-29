#' Check Type
#'
#' @description
#' Checks inherits strictly from S3 class using
#'
#' `is.object(x, class) && !isS4(x) && !inherits(x, "R6") && !inherits(x, "S7_object")`
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
#' @examples
#' # chk_s3_class_strict
#' chk_s3_class_strict(factor(1), "factor")
#' try(chk_s3_class_strict(1, "numeric"))
#' try(chk_s3_class_strict(getClass("MethodDefinition"), "classRepresentation"))
#' @export
chk_s3_class_strict <- function(x, class, x_name = NULL) {
  if (vld_s3_class_strict(x, class)) {
    return(invisible(x))
  }
  if (is.null(x_name)) {
    x_name <- deparse_backtick_chk(substitute(x))
  }
  .class <- cc(class, conj = " or ", chk = FALSE)
  abort_chk(
    x_name,
    " must strictly inherit from an S3 class called ",
    .class,
    x = x,
    .class = .class
  )
}

#' @describeIn chk_s3_class_strict Validate Inherits from S3 Class
#'
#' @examples
#' # vld_s3_class_strict
#' vld_s3_class_strict(numeric(0), "numeric")
#' vld_s3_class_strict(getClass("MethodDefinition"), "classRepresentation")
#' @export
vld_s3_class_strict <- function(x, class) {
  inherits(x, class) &&
    is.object(x) &&
    !isS4(x) && # R5 classes count as S4
    !inherits(x, "R6") &&
    !inherits(x, "S7_object")
}
