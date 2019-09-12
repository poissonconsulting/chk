context("duplicated")

test_that("test if incomparables implemented in anyDuplicated.data.frame", {
  expect_error(
    anyDuplicated(data.frame(), incomparables = NA),
    "^argument 'incomparables != FALSE' is not used [(]yet[)]$"
  )
})
