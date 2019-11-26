roxygen2md::roxygen2md()

styler::style_pkg(filetype = c("R", "Rprofile", "Rmd"))

devtools::test()
devtools::document()
# knitr::knit("README.Rmd")
devtools::check()
