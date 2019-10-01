context("chk-file")

test_that("vld_file", {
  expect_false(vld_file(character(0)))
  expect_false(vld_file(tempdir()))
  file <- paste0(tempfile(), ".csv")
  expect_false(vld_file(file))

  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(vld_file(file))
  expect_false(vld_file(dirname(file)))
})

test_that("chk_file", {
  expect_chk_error(
    chk_file(character(0)),
    "^`character[(]0[)]` must be a string [(]non-missing character scalar[)][.]$"
  )

  expect_chk_error(chk_file(tempdir()), "`tempdir[(][)]` must specify a file [(]'.*' is a directory[)][.]$")

  file1 <- paste0(tempfile(), "1.csv")
  expect_chk_error(
    chk_file(file1),
    "^`file1` must specify an existing file [(]'.*[.]csv' can't be found[)][.]$"
  )
  write.csv(data.frame(x = 1), file1)
  teardown(unlink(file1))
  expect_null(chk_file(file1))
  expect_invisible(chk_file(file1))

  expect_null(chk_all(character(0), chk_file))
  expect_invisible(chk_all(character(0), chk_file))
  expect_null(chk_all(file1, chk_file))
  expect_invisible(chk_all(file1, chk_file))
  expect_null(chk_all(c(file1, file1), chk_file))
  expect_invisible(chk_all(c(file1, file1), chk_file))
  expect_chk_error(
    chk_all(c(file1, p0(file1, "b")), chk_file, x_name = "`vec`"),
    "^All elements of `vec` must specify an existing file [(]'.*[.]csvb' can't be found[)][.]$"
  )
})

test_that("vld_dir", {
  expect_false(vld_dir(character(0)))
  expect_true(vld_dir(tempdir()))
  expect_false(vld_dir(tempfile()))
})

test_that("chk_dir", {
  expect_null(chk_dir(tempdir()))
  expect_invisible(chk_dir(tempdir()))
  expect_chk_error(
    chk_dir(tempfile()),
    "^`tempfile[(][)]` must specify an existing directory [(]'.*' can't be found[)][.]$"
  )

  file1 <- paste0(tempfile(), "1.csv")
  write.csv(data.frame(x = 1), file1)
  teardown(unlink(file1))
  expect_chk_error(
    chk_dir(file1),
    "^`file1` must specify a directory [(]'.*[.]csv' is a file[)][.]$"
  )

  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_chk_error(chk_dir(path), "^`path` must specify an existing directory [(]'.*' can't be found[)][.]$")
  expect_chk_error(chk_dir(1), "^`1` must be a string [(]non-missing character scalar[)][.]$")
  expect_invisible(chk_all(c(tempdir(), tempdir()), chk_dir))
  expect_chk_error(
    chk_all(c(tempdir(), p0(tempdir(), "b")), chk_dir, x_name = "`vec`"),
    "^All elements of `vec` must specify an existing directory [(]'.*b' can't be found[)][.]$"
  )
})

test_that("vld_ext", {
  expect_false(vld_ext(character(0)))
  expect_false(vld_ext("file.pdf", "PDF"))
  expect_false(vld_ext(c("file.pdf", "file.pdf"), "pdf"))
  expect_true(vld_ext("file.pdf", "pdf"))
  expect_true(vld_ext("file.png", c("pdf", "png")))
})

test_that("chk_ext", {
  expect_chk_error(
    chk_ext(character(0)),
    "^`character[(]0[)]` must be a string [(]non-missing character scalar[)][.]$"
  )
  expect_chk_error(
    chk_ext("file.pdf", "png"),
    "^`\"file.pdf\"` must have extension 'png' [(]not 'pdf'[)][.]$"
  )
  expect_chk_error(
    chk_ext("file.pdf", c("png", "PDF")),
    "^`\"file.pdf\"` must have extension 'png' or 'PDF' [(]not 'pdf'[)][.]$"
  )
  expect_null(chk_ext("file.pdf", "pdf"))
  expect_invisible(chk_ext("file.pdf", "pdf"))
})
