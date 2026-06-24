if (FALSE) {
  covr::report(covr::file_coverage("R/chk-class.R", "tests/testthat/test-chk-class.R"))
}

test_that("chk_class() checks classes correctly.", {
  # original GitHub issue used {lubridate}, which is not in Suggests
  # (https://github.com/poissonconsulting/chk/issues/243)
  expect_invisible(chk_class("01:02:03", "character"), "01:02:03")
  local_s4_class("exampleS4class", slots = c(value = "numeric"))
  expect_invisible(chk_class(new("exampleS4class"), "exampleS4class"),
                   new("exampleS4class"))
  expect_invisible(chk_class(chk_class, "function"), chk_class)

  expect_invisible(chk_class(1, "numeric"), 1)
  expect_invisible(chk_class("1", "character"), "1")
  expect_invisible(chk_class("1", "character"), 1) # base R idiosyncracy
  expect_invisible(chk_class("1", "character"), 1L) # base R idiosyncracy
  expect_invisible(chk_class(1L, "integer"), 1L)

  expect_error(chk_class("a", "integer"), "`\"a\"` must inherit from class 'integer'\\.")
  expect_error(chk_class("a", "fakeClass"), "`\"a\"` must inherit from class 'fakeClass'\\.")
  expect_error(chk_class(chk_class, "notFunction"), "`chk_class` must inherit from class 'notFunction'.")
})
