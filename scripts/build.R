roxygen2md::roxygen2md()
styler::style_pkg(
  scope = "line_breaks",
  filetype = c("R", "Rmd")
)
lintr::lint_package()

devtools::test()
devtools::document()

pkgdown::build_home()
pkgdown::build_site()

devtools::check()
