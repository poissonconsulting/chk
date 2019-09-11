chk_ <- function(condition, ...) {
  # Infer class name from function call used in condition
  expr_condition <- enexpr(condition)
  
  if(!condition) {
    # Get x and x_name from parent frame
    x_name <- get("x_name", parent.frame())
    if(is.null(x_name))  x_name <- tick(as_label(substitute(x, parent.frame())))
    
    class <- gsub("vld_", "", as_string(expr_condition[[1]]))
    abort(p0(x_name, ...), .subclass = c(p0("chk_error_", class), "chk_error"))
  }
}
