test_that("test if incomparables implemented in anyDuplicated.data.frame", {
  expect_error(
    anyDuplicated(data.frame(), incomparables = NA),
    "^argument 'incomparables != FALSE' is not used [(]yet[)]$"
  )
})

test_that("object_type identifies S3 objects", {
  expect_identical(object_type(1), "S3")
  expect_identical(object_type(matrix(1)), "S3")
  expect_identical(object_type(factor(1)), "S3")
  expect_identical(object_type(data.frame()), "S3")
})

test_that("object_type identifies S4 objects", {
  expect_identical(object_type(getClass("MethodDefinition")), "S4")
  expect_identical(
    object_type(setRefClass("exampleRefClass", fields = "value")$new()),
    "S4"
  )
})

test_that("object_type identifies R6 objects", {
  skip_if_not_installed("R6")
  expect_identical(object_type(R6::R6Class("exampleR6class")$new()), "R6")
  # a generator is not an R6 object
  expect_identical(object_type(R6::R6Class("exampleR6class")), "S3")
})

test_that("object_type identifies S7 objects", {
  skip_if_not_installed("S7")
  expect_identical(object_type(S7::new_class("exampleS7class")()), "S7")
  # a generator is itself an S7 object
  expect_identical(object_type(S7::new_class("exampleS7class")), "S7")
})
