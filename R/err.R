#' Tidyverse Style Message
#' 
#' Constructs a tidyverse style message by
#' 
#' \itemize{
#'   \item Capitalizing the first character if possible.
#'   \item Adding a trailing . if missing.
#'   \item Replacing the recognized \code{sprintf}-like types.
#' }
#' 
#' @section \code{sprintf}-like types:
#' 
#' The following recognized \code{sprintf}-like types can be used in a message:
#'
#' \describe{
#'   \item{\code{n}}{The value of n.}
#'   \item{\code{s}}{'' if n == 1 otherwise 's'}
#'   \item{\code{r}}{'is' if n == 1 otherwise 'are'}
#' }
#'
#' @param ... Multiple objects that are converted to a string using 
#' \code{paste0(..., collapse = '')}.
#' @param n The value of n for converting \code{sprintf}-like types.
#'
#' @return A string of the tidyverse style message.
#' @export
#'
#' @examples
#' message_chk("there %r %n", " problem%s")
#' message_chk("there %r %n", " problem%s", n = 1)
#' message_chk("There %r %n", " problem%s.", n = 3)
message_chk <- function(..., n = NULL) {
  string <- p0(..., collapse = "")
  if (!is.null(n)) {
    string <- gsub("%s", if (n == 1) "" else "s", string, fixed = TRUE)
    string <- gsub("%r", if (n == 1) "is" else "are", string, fixed = TRUE)
    string <- gsub("%n", n, string, fixed = TRUE)
  }
  if(!grepl("[.]$", string)) string <- p0(string, ".")
  string <- p0(toupper(substr(string, 1, 1)), substr(string, 2, nchar(string)))
  string
}

#' Stop, Warning and Message Messages
#'
#' The functions call \code{\link{message_chk}()} to process
#' the message and then 
#' \code{\link[rlang]{abort}()}, \code{\link[rlang]{warn}()} and
#'  \code{\link[rlang]{inform}()}, respectively.
#'  
#'  The user can set the subclass.
#'
#' @inheritParams base::stop
#' @inheritParams rlang::abort
#' @inheritParams message_chk
#' @name err
NULL

#' @describeIn err Error
#'
#' @export
#'
#' @examples
#'
#' # err
#' try(err("there %r %n problem value%s", n = 2))
err <- function(..., n = NULL, .subclass = NULL) {
  abort(message_chk(..., n = n), .subclass = .subclass)
}

#' @describeIn err Warning
#'
#' @export
#'
#' @examples
#'
#' # wrn
#' wrn("there %r %n problem value%s", n = 2)
wrn <- function(..., n = NULL, .subclass = NULL) {
  warn(message_chk(..., n = n), .subclass = .subclass)
}

#' @describeIn err Message
#'
#' @export
#'
#' @examples
#'
#' # msg
#' msg("there %r %n problem value%s", n = 2)
msg <- function(..., n = NULL, .subclass = NULL) {
  inform(message_chk(..., n = n), .subclass = .subclass)
}
