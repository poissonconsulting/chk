try_chk <- function (expr) {
  try(eval(expr, envir = parent.frame(3)), silent = TRUE)
}

try_msg <- function (x) {
    x <- as.character(x)
    x <- sub("^Error.*[:] ", "", x, perl = TRUE)
    sub("\n$", "", x, perl = TRUE)
}
