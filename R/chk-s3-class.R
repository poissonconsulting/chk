#' Check Type
#'
#' @description
#' Checks inherits from S3 class using
#'
#' `!isS4(x) && inherits(x, class)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family chk_is
#'
#' @examples
#' # chk_s3_class
#' chk_s3_class(1, "numeric")
#' try(chk_s3_class(getClass("MethodDefinition"), "classRepresentation"))
#' @export
chk_s3_class <- function(x, class, x_name = NULL) {
  if (vld_s3_class(x, class)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(x_name, " must inherit from S3 class '", class, "'", x = x, class = class)
}

#' @describeIn chk_s3_class Validate Inherits from S3 Class
#'
#' @examples
#' # vld_s3_class
#' vld_s3_class(numeric(0), "numeric")
#' vld_s3_class(getClass("MethodDefinition"), "classRepresentation")
#' @export
vld_s3_class <- function(x, class) !isS4(x) && inherits(x, class)
