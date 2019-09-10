try_chk <- function (expr) {
  try(eval(expr, envir = parent.frame(3)), silent = TRUE)
}

try_msg <- function (x) {
    x <- as.character(x)
    x <- sub("^Error.*[:] ", "", x, perl = TRUE)
    x <- sub("\nBacktrace:\n\033.*$", "", x)
    sub("\n$", "", x, perl = TRUE)
}

#' Check OR
#'
#' @param ... Multiple \code{chk_} functions.
#' @inheritParams chk_true
#'
#' @return An informative error if the test fails.
#' @export
#'
#' @examples
#' chkor()
#' chkor(chk_flag(TRUE))
#' try(chkor(chk_flag(1)))
#' try(chkor(chk_flag(1), chk_flag(2)))
#' chkor(chk_flag(1), chk_flag(TRUE))
chkor <- function (...) {
  args <- substitute(list(...))[-1]
  n <- length(args)
  if (n == 0L) return(invisible())

  msg <- as.list(rep(NA, n))
  for(i in 1:n) {
    try <- try_chk(args[[i]])
    if(is.null(try)) return(invisible())
    msg[i] <- try
  }
  msg <- unlist(lapply(msg, try_msg))
  msg <- unique(msg)
  if(length(msg) == 1) stop(msg, call. = FALSE) 
  msg <- paste0("\n* ", msg)
  msg <- c("At least one of the following conditions must be met:", msg)
  stop(msg, call. = FALSE)
}
