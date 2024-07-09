# necessary hack because for data frames
# argument 'incomparables != FALSE' is not used (yet)
.anyDuplicated <- function(x, incomparables = FALSE) {
  if (vld_false(incomparables) || is.null(incomparables) || !length(incomparables)) {
    return(anyDuplicated(x))
  }
  if (!is.data.frame(x)) {
    return(anyDuplicated(x, incomparables = incomparables))
  }

  y <- as.data.frame(lapply(x, function(col, y) col %in% y, y = incomparables))
  y <- apply(y, 1, any)
  x <- x[!y, , drop = FALSE]

  anyDuplicated(x)
}

# remove when no longer support R < 3.6.0
str2lang <- function(text) {
  ex <- parse(text = text, keep.source = FALSE)
  ex[[1L]]
}
