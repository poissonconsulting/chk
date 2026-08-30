test_that("deparse_backtick_chk", {
  expect_identical(deparse_backtick_chk(1), "`1`")
  expect_identical(deparse_backtick_chk(NA), "`NA`")
  expect_identical(deparse_backtick_chk("1"), "`\"1\"`")
  expect_identical(deparse_backtick_chk(substitute(1)), "`1`")
  expect_identical(deparse_backtick_chk(substitute(NA)), "`NA`")
  expect_identical(deparse_backtick_chk(substitute("1")), "`\"1\"`")
})

test_that("backtick_chk", {
  expect_identical(backtick_chk(1), "`1`")
  expect_identical(backtick_chk("`1`"), "`1`")
})

test_that("unbacktick_chk", {
  expect_identical(unbacktick_chk(1), "1")
  expect_identical(unbacktick_chk("`1`"), "1")
  expect_identical(unbacktick_chk("``1``"), "1")
})

test_that("deparse_backtick_chk returns a string for multiline expressions", {
  expect_identical(
    deparse_backtick_chk(quote(
      data.frame(fac = factor(c("a", "b", "z"), levels = c("a", "z", "b")))
    )),
    "`data.frame(fac = factor(c(\"a\", \"b\", \"z\"), levels = c(\"a\", \"z\", \"b\")))`"
  )
})
