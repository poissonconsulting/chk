#' Check Complex
#'
#' @description
#' Checks if complex using
#'
#' `is.complex(x)`
#'
#' @inheritParams params
#' @inherit params return
#'
#' @family data_type_checkers
#'
#' @seealso [is.complex()]
#' @seealso For more details about the use of this function,
#' please read the article
#' \href{https://poissonconsulting.github.io/chk/articles/chk-families.html}{chk families}.
#'
#' @examples
#' # chk_complex
#' chk_complex(1i)
#' try(chk_complex(1))
#' @export
chk_complex <- function(x, x_name = NULL) {
  if (vld_complex(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  abort_chk(x_name, " must be complex", x = x)
}

#' @describeIn chk_complex Validate Complex
#'
#' @examples
#' # vld_complex
#' vld_complex(1i)
#' vld_complex(complex())
#' vld_complex(NA_complex_)
#' vld_complex(1)
#' vld_complex(TRUE)
#' @export
vld_complex <- function(x) is.complex(x)
