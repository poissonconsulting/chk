#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
try_chk <- function (expr) {
  try(eval(expr, envir = parent.frame(3)), silent = TRUE)
}

#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
try_msg <- function (x) {
    x <- as.character(x)
    x <- sub("^Error.*[:] ", "", x, perl = TRUE)
    sub("\n$", "", x, perl = TRUE)
}

#' Check OR
#'
#' @param ... Multiple \code{chk_} functions.
#' @inheritParams chk_true
#'
#' @return A flag or an error if the check fails and err == TRUE.
#' @export
#'
#' @examples
#' chkor()
#' chkor(chk_flag(TRUE))
#' try(chkor(chk_flag(1)))
#' try(chkor(chk_flag(1), chk_flag(2)))
#' chkor(chk_flag(1), chk_flag(TRUE))
#
#  Licence: CC0
#  Repository: https://github.com/poissonconsulting/chk
chkor <- function (..., err = TRUE) {
  args <- substitute(list(...))[-1]
  n <- length(args)
  if (n == 0L) return(TRUE)

  msg <- as.list(rep(NA, n))
  for(i in 1:n) {
    try <- try_chk(args[[i]])
    if(isTRUE(try)) return(TRUE)
    msg[i] <- try
  }
  if(!err) return(FALSE)
  msg <- unlist(lapply(msg, try_msg))
  msg <- unique(msg)
  if(length(msg) == 1) stop(msg, call. = FALSE) 
  msg <- paste0("\n* ", msg)
  msg <- c("At least one of the following conditions must be met:", msg)
  stop(msg, call. = FALSE)
}
