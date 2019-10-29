get_chk_on <- function() {
  pkgload::is_dev_package(onload_env[["pkgname"]])
}

onload_env <- rlang::new_environment()

#' @export
onload <- function(pkgname) {
  onload_env[["pkgname"]] <- pkgname
  onload_env[["ns"]] <- ns <- getNamespace(pkgname)
  onload_env[["exports"]] <- getNamespaceExports(ns)
  
  on.exit({ 
    onload_env[["pkgname"]] <- NULL
    onload_env[["ns"]] <- NULL
    onload_env[["exports"]] <- NULL
  })
  
  defmacro::onload(pkgname, macros = list(chk_true = chk_true))
}
