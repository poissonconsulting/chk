transformers <- styler::tidyverse_style(strict = FALSE)
transformers$space$add_space_after_for_if_while <- NULL
styler::style_pkg(transformers = transformers)

devtools::test()
devtools::document()
# knitr::knit("README.Rmd")
if(FALSE) {
  if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
  pkgdown::build_site()
}
devtools::check()
