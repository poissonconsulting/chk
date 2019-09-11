chk_ <- function(condition, class, x, x_name, ...) {
  # Need to enexpr() proactively, because evaluating the condition forces the
  # x promise, and enexpr() no longer works
  x <- enexpr(x)
  
  if(!condition) {
    if(is.null(x_name))  x_name <- tick(as_label(x))
    abort(p0(x_name, ...), .subclass = c(p0("chk_error_", class), "chk_error"))
  }
}
