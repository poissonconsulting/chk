skip_if_not_installed("S7")

test_that("vld_s7_class", {
  x <- S7::new_class("exampleS7class", package = "mypkg")()
  expect_true(vld_s7_class(x, "mypkg::exampleS7class"))
  expect_true(vld_s7_class(x, "S7_object"))
  expect_false(vld_s7_class(x, "mypkg::otherS7class"))
})

test_that("vld_s7_class matches the package qualified class name", {
  x <- S7::new_class("exampleS7class", package = "mypkg")()
  expect_identical(class(x), c("mypkg::exampleS7class", "S7_object"))
  expect_false(vld_s7_class(x, "exampleS7class"))
})

test_that("vld_s7_class is FALSE for non-S7 objects", {
  expect_false(vld_s7_class(1, "numeric"))
  expect_false(vld_s7_class(factor(1), "factor"))
  expect_false(vld_s7_class(
    getClass("MethodDefinition"),
    "classRepresentation"
  ))
  skip_if_not_installed("R6")
  expect_false(vld_s7_class(R6::R6Class("exampleR6class")$new(), "R6"))
})

test_that("vld_s7_class recognises inherited S7 classes", {
  parent <- S7::new_class("ParentS7class", package = "mypkg")
  child <- S7::new_class("ChildS7class", parent = parent, package = "mypkg")
  x <- child()
  expect_true(vld_s7_class(x, "mypkg::ChildS7class"))
  expect_true(vld_s7_class(x, "mypkg::ParentS7class"))
})

test_that("vld_s7_class matches any of multiple classes", {
  x <- S7::new_class("exampleS7class", package = "mypkg")()
  expect_true(vld_s7_class(x, c("mypkg::other", "mypkg::exampleS7class")))
  expect_false(vld_s7_class(x, c("mypkg::other", "mypkg::another")))
})

test_that("an S7 class generator is itself an S7 object", {
  generator <- S7::new_class("exampleS7class", package = "mypkg")
  # unlike R6, S7 is self-describing, so a generator is an S7 object,
  # but only of class 'S7_class' and not of the class it generates
  expect_identical(class(generator), c("S7_class", "S7_object"))
  expect_true(vld_s7_class(generator, "S7_class"))
  expect_false(vld_s7_class(generator, "mypkg::exampleS7class"))
})

test_that("chk_s7_class returns x invisibly", {
  x <- S7::new_class("exampleS7class", package = "mypkg")()
  expect_identical(chk_s7_class(x, "mypkg::exampleS7class"), x)
  expect_invisible(chk_s7_class(x, "mypkg::exampleS7class"))
})

test_that("chk_s7_class errors informatively", {
  expect_chk_error(
    chk_s7_class(1, "numeric"),
    "^`1` must inherit from S7 class 'numeric', not S3 class 'numeric'\\.$"
  )
  expect_chk_error(
    chk_s7_class(matrix(1), "numeric"),
    paste0(
      "^`matrix\\(1\\)` must inherit from S7 class 'numeric', ",
      "not S3 classes 'matrix' and 'array'\\.$"
    )
  )
  expect_chk_error(
    chk_s7_class(getClass("MethodDefinition"), "numeric"),
    paste0(
      "^`getClass\\(\"MethodDefinition\"\\)` must inherit from S7 class ",
      "'numeric', not S4 class 'classRepresentation'\\.$"
    )
  )
})

test_that("chk_s7_class errors informatively for an S7 object", {
  x <- S7::new_class("exampleS7class", package = "mypkg")()
  expect_chk_error(
    chk_s7_class(x, c("a", "b")),
    paste0(
      "^`x` must inherit from S7 classes 'a' or 'b', ",
      "not S7 classes 'mypkg::exampleS7class' and 'S7_object'\\.$"
    )
  )
})

test_that("chk_s7_class respects x_name", {
  expect_chk_error(
    chk_s7_class(1, "numeric", x_name = "`foo`"),
    "^`foo` must inherit from S7 class 'numeric', not S3 class 'numeric'\\.$"
  )
})
