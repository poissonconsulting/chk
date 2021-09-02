#' Workaround: Avoid backtraces in examples
#'
#' This example will run first and set the option for the process that builds
#' the example.
#' (By default, pkgdown builds in a separate process.)
#' This also produces a help page that isn't linked from anywhere.
#'
#' @name aaa
#' @keywords internal
#' @examples
#' options(rlang_backtrace_on_error = "none")
NULL
