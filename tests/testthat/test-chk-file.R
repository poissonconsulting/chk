context("chk-file")

test_that("chk_file", {
  expect_true(chk_file(character(0)))
  expect_false(chk_file(tempdir(), err = FALSE))
  file <- paste0(tempfile(), ".csv")
  expect_false(chk_file(file, err = FALSE))
  expect_error(chk_file(file), "^Can't find file '.*[.]csv'[.]$")
  file1 <- paste0(tempfile(), "1.csv")
  file2 <- paste0(tempfile(), "2.csv")
  expect_error(chk_file(c(file1, file2)), 
                        "^Can't find the following files: '.*[.]csv' or '.*[.]csv'[.]$")
  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(chk_file(file))
  expect_false(chk_file(dirname(file), err = FALSE))
})

test_that("chk_dir", {
  expect_true(chk_dir(character(0)))
  expect_true(chk_dir(tempdir()))
  expect_error(chk_dir(tempfile()), "^Can't find directory '.*'[.]$")
  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_false(chk_dir(path, err = FALSE))
  expect_error(chk_dir(path), "^Can't find directory '.*chk'[.]$")
  expect_error(chk_dir(c(path, file.path(path, "other"))), "^Can't find the following directories: '.*chk' or '.*other'[.]$")
})
