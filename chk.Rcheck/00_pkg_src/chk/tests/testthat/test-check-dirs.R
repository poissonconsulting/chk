test_that("check_dirs works", {
  expect_identical(check_dirs(character(0)), character(0))
  expect_invisible(check_dirs(character(0)))
  expect_identical(
    check_dirs(character(0), exists = TRUE),
    check_dirs(character(0), exists = TRUE)
  )
  expect_invisible(check_dirs(character(0), exists = TRUE))

  tmp <- withr::local_tempfile()
  expect_identical(check_dirs(tmp, exists = FALSE), check_dirs(tmp, exists = FALSE))
  expect_invisible(check_dirs(tmp, exists = FALSE))
  tmp <- withr::local_tempdir()
  expect_identical(check_dirs(tmp, exists = TRUE), check_dirs(tmp, exists = TRUE))
  expect_invisible(check_dirs(tmp, exists = TRUE))
})

test_that("check_dirs errors", {
  expect_chk_error(check_dirs(NA_character_))

  tmp <- withr::local_tempfile()
  writeLines(tmp, text = "some test data")

  expect_chk_error(
    check_dirs(tmp),
    "^`tmp` must specify directories [(]'.*' is a file[)][.]$"
  )
  expect_chk_error(
    check_dirs(tmp, exists = FALSE),
    "^`tmp` must specify directories [(]'.*' is a file[)][.]$"
  )

  tmp <- withr::local_tempfile()
  expect_chk_error(
    check_dirs(tmp),
    "^`tmp` must specify existing directories [(]'.*' can't be found[)][.]$"
  )

  tmp <- withr::local_tempdir()
  expect_chk_error(
    check_dirs(tmp, exists = FALSE),
    "^`tmp` must not specify existing directories [(]'.*' exists[)][.]$"
  )
})
