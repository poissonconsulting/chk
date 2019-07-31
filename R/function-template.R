#' Function Template
#'
#' A function template.
#' 
#' @param x A flag specifying whether to return TRUE or FALSE.
#' @return A flag.
#' @export
#'
#' @examples
#' function_template()
#' function_template(FALSE)
function_template <- function(x = TRUE) {
  check_flag(x)
  x
}
