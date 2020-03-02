#' Construct Tidyverse Style Message
#'
#' If `tidy = TRUE` constructs a tidyverse style message by
#'
#' \itemize{
#'   \item Capitalizing the first character if possible.
#'   \item Adding a trailing . if missing.
#' }
#'
#' Also if `n != NULL` replaces the recognized `sprintf`-like types.
#'
#' @section `sprintf`-like types:
#'
#' The following recognized `sprintf`-like types can be used in a message:
#'
#' \describe{
#'   \item{`n`}{The value of n.}
#'   \item{`s`}{'' if n == 1 otherwise 's'}
#'   \item{`r`}{'is' if n == 1 otherwise 'are'}
#'   \item{`y`}{'y' if n == 1 otherwise 'ie'}
#' }
#'
#' @param ... Multiple objects that are converted to a string using
#' `paste0(..., collapse = '')`.
#' @param n The value of n for converting `sprintf`-like types.
#' @param tidy A flag specifying whether capitalize the first character and add a missing period.
#'
#' @return A string of the message.
#' @export
#'
#' @examples
#' message_chk("there %r %n", " problem director%y%s")
#' message_chk("there %r %n", " problem director%y%s", n = 1)
#' message_chk("There %r %n", " problem director%y%s.", n = 3)
message_chk <- function(..., n = NULL, tidy = TRUE) {
  string <- p0(..., collapse = "")
  if (!is.null(n)) {
    string <- gsub("%r", if (n == 1) "is" else "are", string, fixed = TRUE)
    string <- gsub("%s", if (n == 1) "" else "s", string, fixed = TRUE)
    string <- gsub("%y", if (n == 1) "y" else "ie", string, fixed = TRUE)
    string <- gsub("%n", n, string, fixed = TRUE)
  }
  if (vld_true(tidy)) {
    if (!grepl("([.]|[?]|[!])$", string)) string <- p0(string, ".")
    string <- p0(toupper(substr(string, 1, 1)), substr(string, 2, nchar(string)))
  }
  string
}

#' Stop, Warning and Message Messages
#'
#' The functions call [message_chk()] to process
#' the message and then
#' [rlang::abort()], [rlang::warn()] and
#'  [rlang::inform()], respectively.
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
err <- function(..., n = NULL, tidy = TRUE, .subclass = NULL) {
  args <- list2(...)
  named <- (names2(args) != "")
  msg <- exec(p0, !!!args[!named], collapse = "")
  msg <- message_chk(msg, n = n, tidy = tidy)

  if (!is.null(args$y)) {
    msg <- paste0(
      msg,
      "\nUse `rlang::last_error()$y` to show the object compared to."
    )
  }

  exec(
    abort,
    msg,
    .subclass = .subclass,
    !!!args[named]
  )
}

#' @describeIn err Warning
#'
#' @export
#'
#' @examples
#'
#' # wrn
#' wrn("there %r %n problem value%s", n = 2)
wrn <- function(..., n = NULL, tidy = TRUE, .subclass = NULL) {
  warn(message_chk(..., n = n, tidy = tidy), .subclass = .subclass)
}

#' @describeIn err Message
#'
#' @export
#'
#' @examples
#'
#' # msg
#' msg("there %r %n problem value%s", n = 2)
msg <- function(..., n = NULL, tidy = TRUE, .subclass = NULL) {
  inform(message_chk(..., n = n, tidy = tidy), .subclass = .subclass)
}
