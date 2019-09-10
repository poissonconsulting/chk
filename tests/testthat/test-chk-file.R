context("chk-file")

test_that("vld_file", {
  expect_true(vld_file(character(0)))
  expect_false(vld_file(tempdir()))
  file <- paste0(tempfile(), ".csv")
  expect_false(vld_file(file))
  
  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(vld_file(file))
  expect_false(vld_file(dirname(file)))
})

test_that("chk_file", {
  expect_null(chk_file(character(0)))
  expect_invisible(chk_file(character(0)))

  file1 <- paste0(tempfile(), "1.csv")
  file2 <- paste0(tempfile(), "2.csv")
  expect_error(chk_file(c(file1)), 
                        "^Can't find file '.*[.]csv'[.]$")
  expect_error(chk_file(c(file1, file2)), 
                        "^Can't find the following files: '.*[.]csv' or '.*[.]csv'[.]$")
})

test_that("vld_dir", {
  expect_true(vld_dir(character(0)))
  expect_true(vld_dir(tempdir()))
  expect_false(vld_dir(tempfile()))
})

test_that("chk_dir", {
  expect_null(chk_dir(tempdir()))
  expect_invisible(chk_dir(tempdir()))
  expect_error(chk_dir(tempfile()), "^Can't find directory '.*'[.]$")
  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_error(chk_dir(path), "^Can't find directory '.*chk'[.]$")
  expect_error(chk_dir(c(path, file.path(path, "other"))), "^Can't find the following directories: '.*chk' or '.*other'[.]$")
})
