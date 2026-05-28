test_that("vld_s3_class_strict", {
  expect_false(vld_s3_class_strict(NULL, "NULL")) # base objects are not S3
  expect_false(vld_s3_class_strict(1, "numeric"))
  expect_false(vld_s3_class_strict(1L, "numeric"))
  expect_false(vld_s3_class_strict(1L, "integer"))
  expect_false(vld_s3_class_strict(list(), "list"))
  expect_true(vld_s3_class_strict(factor(1), "factor"))
  expect_true(vld_s3_class_strict(data.frame(), "data.frame"))

  setClass("exampleS4class", slots = c(value = "numeric"))
  expect_true(class(new("exampleS4class")) == "exampleS4class")
  expect_false(vld_s3_class_strict(new("exampleS4class"), "exampleS4class"))
  invisible(removeClass("exampleS4class"))

  expect_true(
    class(setRefClass("exampleRefClass", fields = "value")$new()) ==
      "exampleRefClass"
  )
  expect_true(isS4(setRefClass("exampleRefClass", fields = "value")$new()))
  expect_false(
    vld_s3_class_strict(
      setRefClass("exampleRefClass", fields = "value")$new(),
      "exampleRefClass"
    )
  )

  expect_true(R6::is.R6(R6::R6Class("exampleR6class")$new()))
  expect_false(vld_s3_class_strict(R6::R6Class("example")$new(),
                                   "R6ClassGenerator"))

  S7_generator <- S7::new_class("exampleS7class")
  expect_true(S7::S7_inherits(S7_generator(), S7_generator))
  expect_false(vld_s3_class_strict(S7_generator(), "S7ClassGenerator"))

  x <- list()
  class(x) <- c("a", "b")
  expect_true(vld_s3_class_strict(x, "a"))
  expect_true(vld_s3_class_strict(x, "b"))
  expect_false(vld_s3_class_strict(
    getClass("MethodDefinition"),
    "classRepresentation"
  ))
})

test_that("chk_s3_class_strict", {
  expect_identical(chk_s3_class_strict(factor(1), "factor"), factor(1), "factor")
  expect_invisible(chk_s3_class_strict(factor(1), "factor"))

  expect_error(chk_s3_class_strict(1L, "integer"),
               "^`1L` must strictly inherit from an S3 class called 'integer'\\.$")

  expect_chk_error(
    chk_s3_class_strict(1, "integer"),
    "^`1` must strictly inherit from an S3 class called 'integer'\\.$"
  )
  expect_chk_error(
    chk_s3_class_strict(matrix(1), "numeric"),
    "`matrix\\(1\\)` must strictly inherit from an S3 class called 'numeric'\\.$"
  )
  x <- list()
  class(x) <- c("a", "b")
  expect_chk_error(chk_s3_class_strict(x, "c"),
                   "^`x` must strictly inherit from an S3 class called 'c'"
  )
  expect_chk_error(
    chk_s3_class_strict(x, "c", x_name = "object name"),
    "Object name must strictly inherit from an S3 class called 'c'"
  )

  foo <- 1
  class(foo) <- "a"
  expect_chk_error(
    chk_s3_class_strict(foo, c("b", "c")),
    "`foo` must strictly inherit from an S3 class called 'b' or 'c'."
  )

  expect_chk_error(chk_s3_class_strict(
    setRefClass("exampleRefClass", fields = "value")$new(),
    "exampleRefClass"
  ),
  "^`setRefClass\\(\"exampleRefClass\", fields = \"value\"\\)\\$new\\(\\)` must strictly inherit from an S3 class called 'exampleRefClass'\\.$"
  )

  expect_true(R6::is.R6(R6::R6Class("exampleR6class")$new()))
  expect_false(vld_s3_class_strict(R6::R6Class("example")$new(), "R6ClassGenerator"))

  S7_generator <- S7::new_class("exampleS7class")
  expect_true(inherits(S7_generator(), S7_generator))
  expect_false(vld_s3_class_strict(S7_generator(), "S7ClassGenerator"))
})
