roxygen2md::roxygen2md()

styler::style_pkg(filetype = c("R", "Rmd"))

lintr::lint_package()
devtools::test()
devtools::document()
rmarkdown::render("README.Rmd", output_format = "md_document")
if(FALSE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
devtools::check()
