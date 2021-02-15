test_that("on", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  setup(chk_off())

  teardown({
    rlang::scoped_options(lifecycle_verbosity = "quiet")
    chk_on()
  })

  expect_false(is_chk_on())
  expect_identical(chk_on(), list(chk.on = FALSE))
  expect_true(is_chk_on())
  expect_identical(chk_on(), list(chk.on = TRUE))
  expect_identical(chk_off(), list(chk.on = TRUE))
  expect_false(is_chk_on())
  expect_identical(chk_off(), list(chk.on = FALSE))
})

test_that("vld_no_missing", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_true(vld_no_missing(1))
  expect_true(vld_no_missing(integer(0)))
  expect_false(vld_no_missing(NA))
  expect_false(vld_no_missing(c(NA, 1)))
})

test_that("chk_no_missing", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_null(chk_no_missing(1))
  expect_invisible(chk_no_missing(1))
  expect_chk_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
  expect_chk_error(chk_no_missing(NA, x_name = "1"), "^1 must not have missing values[.]$")
})


test_that("warning messages are generated for dep functions", {
  rlang::scoped_options(lifecycle_verbosity = "warning")

  expect_warning(chk_count(1))
  expect_warning(chk_dirs(tempdir()))
  expect_warning(chk_has(1:3, 1))
  expect_warning(chk_in(1, 1:3))
  expect_warning(chk_length(1))
  expect_warning(chk_no_missing(1))
  expect_warning(vld_no_missing(1))
  expect_warning(chk_off())
  expect_warning(chk_on())
  expect_warning(is_chk_on())
  expect_warning(chk_proportion(1))
  expect_warning(deparse_backtick(2))

  file <- tempfile()
  writeLines(file, text = "some test data")
  expect_warning(chk_files(file))
})

