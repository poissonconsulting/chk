test_that("vld_s3_class", {
  expect_true(vld_s3_class(1, "numeric")) # base objects are considered S3 here
  expect_false(vld_s3_class(1L, "numeric"))
  expect_true(vld_s3_class(1L, "integer"))

  local_s4_class("exampleS4class", slots = c(value = "numeric"))
  expect_true(class(new("exampleS4class")) == "exampleS4class")
  expect_false(vld_s3_class(new("exampleS4class"), "exampleS4class"))

  expect_true(
    class(setRefClass("exampleRefClass", fields = "value")$new()) ==
      "exampleRefClass"
  )
  expect_true(isS4(setRefClass("exampleRefClass", fields = "value")$new()))
  expect_false(
    vld_s3_class(
      setRefClass("exampleRefClass", fields = "value")$new(),
      "exampleRefClass"
    )
  )

  expect_true(R6::is.R6(R6::R6Class("exampleR6class")$new()))
  expect_false(vld_s3_class(R6::R6Class("example")$new(), "R6ClassGenerator"))

  if (requireNamespace("S7", quietly = TRUE)) {
    S7_generator <- S7::new_class("exampleS7class")
    expect_true(S7::S7_inherits(S7_generator(), S7_generator))
    expect_false(vld_s3_class(S7_generator(), "S7ClassGenerator"))
  }

  x <- list()
  class(x) <- c("a", "b")
  expect_true(vld_s3_class(x, "a"))
  expect_true(vld_s3_class(x, "b"))
  expect_true(vld_s3_class(x, c("a", "b")))
  expect_false(vld_s3_class(
    getClass("MethodDefinition"),
    "classRepresentation"
  ))
})

test_that("chk_s3_class", {
  expect_identical(chk_s3_class(1L, "integer"), 1L, "integer")
  expect_invisible(chk_s3_class(1L, "integer"))
  expect_chk_error(
    chk_s3_class(1, "integer"),
    "^`1` must inherit from S3 class 'integer', not S3 class 'numeric'\\.$"
  )
  expect_chk_error(
    chk_s3_class(matrix(1), "numeric"),
    "^`matrix\\(1\\)` must inherit from S3 class 'numeric', not S3 class 'matrix' and 'array'\\.$"
  )
  x <- list()
  class(x) <- c("a", "b")
  expect_identical(chk_s3_class(x, c("a", "b")), x)
  expect_chk_error(chk_s3_class(x, "c"), "^`x` must inherit from S3 class 'c', not S3 class 'a' and 'b'\\.$")
  expect_chk_error(
    chk_s3_class(x, "c", x_name = "c"),
    "^C must inherit from S3 class 'c', not S3 class 'a' and 'b'\\.$"
  )

  foo <- 1
  class(foo) <- "a"
  expect_chk_error(
    chk_s3_class(foo, c("b", "c")),
    "^`foo` must inherit from S3 classes 'b' or 'c', not S3 class 'a'\\.$"
  )

  class(foo) <- c("a", "z")
  expect_chk_error(
    chk_s3_class(foo, c("b", "c")),
    "^`foo` must inherit from S3 classes 'b' or 'c', not S3 class 'a' and 'z'\\.$"
  )

  expect_chk_error(chk_s3_class(
    setRefClass("exampleRefClass", fields = "value")$new(),
    "exampleRefClass"
  ), "^`setRefClass\\(\"exampleRefClass\", fields = \"value\"\\)\\$new\\(\\)` must inherit from S3 class 'exampleRefClass', not S4 class 'exampleRefClass'\\.$")

  expect_true(R6::is.R6(R6::R6Class("exampleR6class")$new()))
  expect_false(vld_s3_class(R6::R6Class("example")$new(), "R6ClassGenerator"))

  if (requireNamespace("S7", quietly = TRUE)) {
    S7_generator <- S7::new_class("exampleS7class")
    expect_true(inherits(S7_generator(), S7_generator))
    expect_false(vld_s3_class(S7_generator(), "S7ClassGenerator"))
  }
})
