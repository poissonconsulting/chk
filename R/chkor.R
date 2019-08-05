#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
try_chk <- function (expr) {
  try(eval(expr, envir = parent.frame(3)), silent = TRUE)
}

#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
try_msg <- function (x) {
    x <- as.character(x)
    x <- sub("^Error.*[:] ", "", x, perl = TRUE)
    sub("\n$", "", x, perl = TRUE)
}

#' Check OR
#'
#' @param ... Multiple \code{\link{chk}} functions.
#' @inheritParams chk_true
#'
#' @return A flag or an error if the check fails and err == TRUE.
#' @export
#'
#' @examples
#' chkor()
#' chkor(chk_flag(TRUE))
#' chkor(chk_flag(1), err = FALSE)
#' chkor(chk_flag(1), chk_flag(2), err = FALSE)
#' chkor(chk_flag(1), chk_flag(TRUE))
#
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chkor <- function (..., err = TRUE) {
  args <- substitute(list(...))[-1]
  n <- length(args)
  if (n == 0L) return(TRUE)
  args <- lapply(args, try_chk)
  args <- args[vapply(args, inherits, TRUE, "try-error")]
  if (length(args) != n) return(TRUE)
  if(!err) return(FALSE)
  
  args <- unlist(lapply(args, try_msg))
  args <- args[!duplicated(args)]
  if(length(args) == 1) stop(args) 
  args <- p0("\n* ", args)
  args <- c("At least one of the following conditions must be met:", args)
  err(args)
}
