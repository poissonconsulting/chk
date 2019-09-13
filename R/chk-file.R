#' Check/Validate Files or Directories Exist
#'
#' Checks/validates if files or directorys exist.
#'
#' @inheritParams chk_true
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_file
NULL

#' @describeIn chk_file Check File
#'
#' Checks if files exist using \code{vld_file()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_file
#' try(chk_file(tempfile()))
chk_file <- function(x) {
  if (vld_file(x)) {
    return(invisible())
  }
  x <- unique(x)
  x <- x[!file.exists(x) | dir.exists(x)]
  if (length(x) == 1L) {
    abort_chk("can't find the following file: ", cc(x, " or "))
  }
  abort_chk("can't find the following %n file%s: ", cc(x, " or "),
    n = length(x)
  )
}

#' @describeIn chk_file Validate File
#'
#' Checks if files exist using \code{all(\link{file.exists}(x) && !dir.exists(x))}.
#'
#' @export
#'
#' @examples
#'
#' # vld_file
#' vld_file(tempfile())
vld_file <- function(x) all(file.exists(x) & !dir.exists(x))

#' @describeIn chk_file Check Directories Exist
#'
#' Checks if directories exist using \code{vld_dir()}.
#'
#' @export
#'
#' @examples
#'
#' # chk_dir
#' try(chk_dir(tempfile()))
chk_dir <- function(x) {
  if (vld_dir(x)) {
    return(invisible())
  }
  x <- unique(x)
  x <- x[!dir.exists(x)]
  if (length(x) == 1L) {
    abort_chk("can't find the following directory: ", cc(x, " or "))
  }
  abort_chk("can't find the following %n director%y%s: ", cc(x, " or "),
    n = length(x)
  )
}

#' @describeIn chk_file Validate Directories Exist
#'
#' Checks if directories exist using \code{all(\link{dir.exists}(x))}.
#'
#' @export
#'
#' @examples
#'
#' # vld_dir
#' vld_dir(tempfile())
vld_dir <- function(x) all(dir.exists(x))
