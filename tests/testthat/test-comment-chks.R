test_that("comment_chks works no length", {
  expect_identical(comment_chks(character(0)), character(0))
})

test_that("comment_chks works single row", {
  expect_identical(comment_chks("chk_flag(TRUE)"),
                   "# !chk chk_flag(TRUE)")
})

test_that("comment_chks works single row chk::", {
  expect_identical(comment_chks("chk::chk_flag(TRUE)"),
                   "# !chk chk::chk_flag(TRUE)")
})

test_that("comment_chks works single row with spaces ", {
  expect_identical(comment_chks(" chk :: chk_flag ( TRUE)"),
                   "# !chk  chk :: chk_flag ( TRUE)")
})

test_that("comment_chks works single row with two chk statements ", {
  expect_identical(comment_chks("chk::chk_flag(TRUE); chk::chk_string(TRUE)"),
                   "# !chk chk::chk_flag(TRUE); chk::chk_string(TRUE)")
})

test_that("comment_chks works multiple rows ", {
  expect_identical(comment_chks(c(
    "chk_flag(TRUE)",
    "chk_string(TRUE)")),
    c("# !chk chk_flag(TRUE)", "# !chk chk_string(TRUE)"))
})

test_that("uncomment_chks works no length", {
  expect_identical(uncomment_chks(character(0)), character(0))
})

test_that("uncomment_chks works single row", {
  expect_identical(uncomment_chks(comment_chks("chk_flag(TRUE)")),
                   "chk_flag(TRUE)")
})

test_that("uncomment_chks works single row chk::", {
  expect_identical(uncomment_chks(comment_chks("chk::chk_flag(TRUE)")),
                   "chk::chk_flag(TRUE)")
})

test_that("uncomment_chks works single row with spaces ", {
  expect_identical(uncomment_chks(comment_chks(" chk :: chk_flag ( TRUE)")),
                   " chk :: chk_flag ( TRUE)")
})

test_that("uncomment_chks works single row with two chk statements ", {
  expect_identical(uncomment_chks(comment_chks("chk::chk_flag(TRUE); chk::chk_string(TRUE)")),
                   "chk::chk_flag(TRUE); chk::chk_string(TRUE)")
})

test_that("uncomment_chks works multiple rows ", {
  expect_identical(uncomment_chks(comment_chks(c(
    "chk_flag(TRUE)",
    "chk_string(TRUE)"))),
    c(
      "chk_flag(TRUE)",
      "chk_string(TRUE)"))
})

test_that("uncomment_chks works gaps ", {
  expect_identical(uncomment_chks(" #  !chk chk_flag(TRUE)"),
                   "chk_flag(TRUE)")
})

test_that("uncomment_chks preserves indentation ", {
  expect_identical(uncomment_chks(" #  !chk  chk_flag(TRUE)"),
                   " chk_flag(TRUE)")
})
