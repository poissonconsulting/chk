#' Check OR
#'
#' @param ... Multiple \code{\link{chk}} functions.
#' @inheritParams chk_flag
#'
#' @return A flag or an error if the check fails and \code{isTRUE(err)}.
#' @export
#'
#' @examples
#' chkor()
#' chkor(chk_flag(TRUE))
#' chkor(chk_flag(1), err = FALSE)
#' chkor(chk_flag(1), chk_flag(2), err = FALSE)
#' chkor(chk_flag(1), chk_flag(TRUE))
chkor <- function (..., err = TRUE) {
  args <- substitute(list(...))[-1]
  n <- length(args)
  if (identical(n, 0L)) return(TRUE)
  args <- lapply(args, try_chk)
  args <- args[vapply(args, inherits, TRUE, "try-error")]
  if (!identical(length(args), n)) return(TRUE)
  if(!isTRUE(err)) return(FALSE)
  
  args <- unlist(lapply(args, try_msg))
  args <- args[!duplicated(args)]
  args <- p(args, collapse = " OR ")
  err(args)
}
