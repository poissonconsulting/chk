do_package_checks(codecov = ci_has_env("RUN_CODECOV"))

if (ci_on_travis() && ci_has_env("BUILD_PKGDOWN")) {
  do_pkgdown()
}
