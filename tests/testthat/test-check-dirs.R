test_that("check_dirs works", {
  expect_identical(check_dirs(character(0)), character(0))
  expect_invisible(check_dirs(character(0)))
  expect_identical(check_dirs(character(0), exists = TRUE),
                   check_dirs(character(0), exists = TRUE))
  expect_invisible(check_dirs(character(0), exists = TRUE))

  setup(dir.create(file.path(tempdir(), "dir")))
  tmp <- file.path(tempdir(), "dir")

  expect_identical(check_dirs(tmp, exists = TRUE), check_dirs(tmp, exists = TRUE))
  expect_invisible(check_dirs(tmp, exists = TRUE))
  unlink(tmp, recursive = TRUE)
  expect_identical(check_dirs(tmp, exists = FALSE), check_dirs(tmp, exists = FALSE))
  expect_invisible(check_dirs(tmp, exists = FALSE))
  teardown(unlink(tmp, recursive = TRUE))
})

test_that("check_dirs errors", {
  expect_chk_error(check_dirs(NA_character_))

  setup(dir.create(file.path(tempdir(), "dir")))
  tmp <- file.path(tempdir(), "dir")
  file <- file.path(tmp, "file")
  setup(writeLines(file, text = "some test data"))

  expect_chk_error(check_dirs(file),
              "^`file` must specify directories [(]'.*' is a file[)][.]$")
  expect_chk_error(check_dirs(file, exists = FALSE),
              "^`file` must specify directories [(]'.*' is a file[)][.]$")

  expect_chk_error(check_dirs(tmp, exists = FALSE),
              "^`tmp` must not specify existing directories [(]'.*' exists[)][.]$")

  unlink(tmp, recursive = TRUE)
  expect_chk_error(check_dirs(tmp),
              "^`tmp` must specify existing directories [(]'.*' can't be found[)][.]$")
  teardown(unlink(tmp, recursive = TRUE))
})
