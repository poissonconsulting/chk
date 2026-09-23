test_that("p", {
  expect_identical(p(), paste())
})

test_that("p0", {
  expect_identical(p0(), paste0())
})

test_that("p passes recycle0 through to paste", {
  expect_identical(p("a", character(0)), "a ")
  expect_identical(p("a", character(0), recycle0 = TRUE), character(0))
  expect_identical(
    p("a", character(0), recycle0 = TRUE),
    paste("a", character(0), recycle0 = TRUE)
  )
})

test_that("p0 passes recycle0 through to paste0", {
  expect_identical(p0("a", character(0)), "a")
  expect_identical(p0("a", character(0), recycle0 = TRUE), character(0))
  expect_identical(
    p0("a", character(0), recycle0 = TRUE),
    paste0("a", character(0), recycle0 = TRUE)
  )
})

test_that("recycle0 gives an empty string when collapse is a string", {
  expect_identical(p("a", character(0), collapse = "", recycle0 = TRUE), "")
  expect_identical(p0("a", character(0), collapse = "", recycle0 = TRUE), "")
})

test_that("recycle0 defaults to FALSE", {
  expect_false(formals(p)$recycle0)
  expect_false(formals(p0)$recycle0)
})
