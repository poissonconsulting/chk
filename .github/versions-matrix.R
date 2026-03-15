tags <- xml2::read_html("https://svn.r-project.org/R/tags/")

bullets <-
  tags |>
  xml2::xml_find_all("//li") |>
  xml2::xml_text()

version_bullets <- grep("^R-([0-9]+-[0-9]+-[0-9]+)/$", bullets, value = TRUE)
versions <- unique(gsub("^R-([0-9]+)-([0-9]+)-[0-9]+/$", "\\1.\\2", version_bullets))

# Respect minimum R version from DESCRIPTION
deps <- desc::desc_get_deps()
r_crit <- deps$version[deps$package == "R"]
if (length(r_crit) == 1) {
  min_r <- as.package_version(gsub("^>= ([0-9]+[.][0-9]+)(?:.*)$", "\\1", r_crit))
  versions <- versions[as.package_version(versions) >= min_r]
}

versions <- setdiff(versions, r_versions)
versions <- tail(versions, 1L)

data.frame(os = "ubuntu-latest", r = versions)
