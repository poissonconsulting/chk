chk_ <- function(condition, x, x_name, ...) {
  # Need to enexpr() proactively, because evaluating the condition forces the
  # x promise, and enexpr() no longer works
  x <- enexpr(x)
  
  # Infer class name from function call used in condition
  expr_condition <- enexpr(condition)
  
  if(!condition) {
    if(is.null(x_name))  x_name <- tick(as_label(x))
    class <- gsub("vld_", "", as_string(expr_condition[[1]]))
    abort(p0(x_name, ...), .subclass = c(p0("chk_error_", class), "chk_error"))
  }
}
