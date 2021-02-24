test_that("check_files works", {
  expect_identical(check_files(character(0)), character(0))
  expect_invisible(check_files(character(0)))
  expect_identical(check_files(character(0), exists = TRUE),
                   check_files(character(0), exists = TRUE))
  expect_invisible(check_files(character(0), exists = TRUE))

  tmp <- tempfile("chk-file")
  setup(writeLines(tmp, text = "some test data"))
  expect_identical(check_files(tmp, exists = TRUE), check_files(tmp, exists = TRUE))
  expect_invisible(check_files(tmp, exists = TRUE))
  unlink(tmp)
  expect_identical(check_files(tmp, exists = FALSE), check_files(tmp, exists = FALSE))
  expect_invisible(check_files(tmp, exists = FALSE))
  teardown(unlink(tmp))
})

test_that("check_files errors", {
  expect_chk_error(check_files(NA_character_))

  tmp <- tempfile("chk-file")
  setup(writeLines(tmp, text = "some test data"))
  expect_chk_error(check_files(tmp, exists = FALSE),
              "^`tmp` must not specify existing files [(]'.*' exists[)][.]$")
  unlink(tmp)
  expect_chk_error(check_files(tmp),
              "^`tmp` must specify existing files [(]'.*' can't be found[)][.]$")
  expect_chk_error(check_files(tempdir()),
              "^`tempdir[(][)]` must specify files [(]'.*' is a directory[)][.]$")
  expect_chk_error(check_files(tempdir(), exists = FALSE),
              "^`tempdir[(][)]` must specify files [(]'.*' is a directory[)][.]$")
  teardown(unlink(tmp))
})
