#' Check TRUE
#'
#' @description 
#' Checks if TRUE using
#'
#' `is.logical(x) && length(x) == 1L && !anyNA(x) && x`
#'
#' @inheritParams  chk_flag
#' @return 
#' The `chk_` functions throw an informative error if the test fails.
#' 
#' The `vld_` functions return a flag indicating whether the test was met.
#' 
#' @family chk_logicalscalars
#' @export
#'
#' @examples
#'
#' # chk_true
#' chk_true(TRUE)
#' try(chk_true(1))
chk_true <- defmacro::defmacro(function(x, x_name = NULL) {
  if (defmacro::is_expanding()) {
    if (get_chk_on()) {
      if(is.null(x_name)) x_name <- rlang::quo_label(x)
      
      rlang::expr(if(!vld_true(!!x)) abort_chk(!!x_name, " must be TRUE"))
    }
  } else {
    if(vld_true(x)) return()
    if(is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
    abort_chk(x_name, " must be TRUE")
  }
})

#' @describeIn chk_true Validate TRUE
#'
#' @export
#'
#' @examples
#'
#' # vld_true
#' vld_true(TRUE)
#' vld_true(FALSE)
#' vld_true(NA)
#' vld_true(0)
#' vld_true(c(TRUE, TRUE))
vld_true <- function(x) is.logical(x) && length(x) == 1L && !anyNA(x) && x

