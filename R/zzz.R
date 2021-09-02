.onLoad <- function(libname, pkgname) {
  backports::import(pkgname, "str2lang")
}
