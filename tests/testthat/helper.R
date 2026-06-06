local_s4_class <- function(Class, ..., .local_envir = parent.frame()) {
  methods::setClass(Class, ...)
  withr::defer(methods::removeClass(Class), envir = .local_envir)
  invisible(Class)
}
