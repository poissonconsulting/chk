styler::style_pkg(
  scope = "line_breaks",
  filetype = c("R", "Rmd")
)

lintr::lint_package()

roxygen2md::roxygen2md()
devtools::document()

devtools::build_readme()

pkgdown::build_home()
pkgdown::build_site()

browseURL("docs/index.html")

devtools::test()
devtools::check()

rcmdcheck::rcmdcheck(
  args = c("--no-manual", "--as-cran"),
  build_args = "--resave-data=best",
  error_on = "warning"
)
