test_that("p", {
  expect_identical(p(), paste())
})

test_that("p0", {
  expect_identical(p0(), paste0())
})
