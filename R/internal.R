# necessary hack because for data frames
# argument 'incomparables != FALSE' is not used (yet)
.anyDuplicated <- function(x, incomparables = FALSE) {
  if (
    vld_false(incomparables) || is.null(incomparables) || !length(incomparables)
  ) {
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

# the class system an object belongs to, for reporting in error messages
# R5 reference classes count as S4; base objects count as S3
object_type <- function(x) {
  if (vld_s4_class(x, class(x))) {
    "S4"
  } else if (inherits(x, "R6")) {
    "R6"
  } else if (inherits(x, "S7_object")) {
    "S7"
  } else {
    "S3"
  }
}
