skip_if_not_installed("R6")

test_that("vld_r6_class", {
  x <- R6::R6Class("exampleR6class")$new()
  expect_true(vld_r6_class(x, "exampleR6class"))
  expect_true(vld_r6_class(x, "R6"))
  expect_false(vld_r6_class(x, "otherR6class"))
})

test_that("vld_r6_class is FALSE for non-R6 objects", {
  expect_false(vld_r6_class(1, "numeric"))
  expect_false(vld_r6_class(factor(1), "factor"))
  expect_false(vld_r6_class(
    getClass("MethodDefinition"),
    "classRepresentation"
  ))
})

test_that("vld_r6_class is FALSE for an R6 class generator", {
  generator <- R6::R6Class("exampleR6class")
  expect_false(R6::is.R6(generator))
  expect_false(vld_r6_class(generator, "R6ClassGenerator"))
})

test_that("vld_r6_class recognises inherited R6 classes", {
  parent <- R6::R6Class("parentR6class")
  child <- R6::R6Class("childR6class", inherit = parent)
  x <- child$new()
  expect_true(vld_r6_class(x, "childR6class"))
  expect_true(vld_r6_class(x, "parentR6class"))
})

test_that("vld_r6_class matches any of multiple classes", {
  x <- R6::R6Class("exampleR6class")$new()
  expect_true(vld_r6_class(x, c("otherR6class", "exampleR6class")))
  expect_false(vld_r6_class(x, c("otherR6class", "anotherR6class")))
})

test_that("chk_r6_class returns x invisibly", {
  x <- R6::R6Class("exampleR6class")$new()
  expect_identical(chk_r6_class(x, "exampleR6class"), x)
  expect_invisible(chk_r6_class(x, "exampleR6class"))
})

test_that("chk_r6_class errors informatively", {
  expect_chk_error(
    chk_r6_class(1, "numeric"),
    "^`1` must inherit from R6 class 'numeric', not S3 class 'numeric'\\.$"
  )
  expect_chk_error(
    chk_r6_class(matrix(1), "numeric"),
    paste0(
      "^`matrix\\(1\\)` must inherit from R6 class 'numeric', ",
      "not S3 classes 'matrix' and 'array'\\.$"
    )
  )
  expect_chk_error(
    chk_r6_class(getClass("MethodDefinition"), "numeric"),
    paste0(
      "^`getClass\\(\"MethodDefinition\"\\)` must inherit from R6 class ",
      "'numeric', not S4 class 'classRepresentation'\\.$"
    )
  )
})

test_that("chk_r6_class errors informatively for an R6 object", {
  x <- R6::R6Class("exampleR6class")$new()
  expect_chk_error(
    chk_r6_class(x, c("a", "b")),
    paste0(
      "^`x` must inherit from R6 classes 'a' or 'b', ",
      "not R6 classes 'exampleR6class' and 'R6'\\.$"
    )
  )
})

test_that("chk_r6_class respects x_name", {
  expect_chk_error(
    chk_r6_class(1, "numeric", x_name = "`foo`"),
    "^`foo` must inherit from R6 class 'numeric', not S3 class 'numeric'\\.$"
  )
})
