test_that("vld_no_missing", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_true(vld_no_missing(1))
  expect_true(vld_no_missing(integer(0)))
  expect_false(vld_no_missing(NA))
  expect_false(vld_no_missing(c(NA, 1)))
})

test_that("chk_no_missing", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_null(chk_no_missing(1))
  expect_invisible(chk_no_missing(1))
  expect_chk_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
  expect_chk_error(chk_no_missing(NA, x_name = "1"), "^1 must not have missing values[.]$")
})


test_that("warning messages are generated for dep functions", {
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_warning(chk_dirs(tempdir()))
  expect_warning(chk_has(1:3, 1))
  expect_warning(chk_in(1, 1:3))
  expect_warning(expect_warning(chk_no_missing(1)))
  expect_warning(vld_no_missing(1))
  expect_warning(chk_proportion(1))
  expect_warning(deparse_backtick(2))

  file <- tempfile()
  writeLines(file, text = "some test data")
  expect_warning(chk_files(file))
})
