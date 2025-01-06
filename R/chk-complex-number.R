#' Check Complex Number
#'
#' @description
#'  Checks if non-missing complex scalar using
#'
#' `is.complex(x) && length(x) == 1L && !anyNA(x)`
#'
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family scalar_checker
#'
#' @seealso [is.integer()]
#' @seealso [vld_true()]
#' @seealso [vld_number()]
#'
#' @seealso For more details about the use of this function,
#' please read the article
#' \href{https://poissonconsulting.github.io/chk/articles/chk-families.html}{chk families}.
#'
#' @examples
#' # chk_complex_number
#' chk_complex_number(as.complex(1.1))
#' try(chk_complex_number(1.1))
#' @export
chk_complex_number <- function(x, x_name = NULL) {
  if (vld_complex_number(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name,
    " must be a complex number (non-missing complex scalar)",
    x = x
  )
}

#' @describeIn chk_complex_number Validate Complex Number
#'
#' @examples
#' # vld_complex_number
#' vld_complex_number(as.complex(2))
#' @export
vld_complex_number <- function(x) {
  is.complex(x) && length(x) == 1L && !anyNA(x)
}
