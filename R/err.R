#' Stop Function Execution
#'
#' A wrapper on \code{\link[base]{stop}(..., call. = FALSE, domain = NA)}.
#' 
#' @inheritParams base::stop
#' @aliases error
#' @export
#'
#' @examples
#' \dontrun{
#' err("this is an error")
#' }
err <- function (...) stop(..., call. = FALSE, domain = NA)
