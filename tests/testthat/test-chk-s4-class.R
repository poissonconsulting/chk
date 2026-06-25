test_that("vld_s4_class", {
  expect_false(vld_s4_class(1, "numeric"))
  expect_true(vld_s4_class(getClass("MethodDefinition"), "classRepresentation"))
  class_1 <- setClass("class_1", slots = list(number = "numeric"))
  class_2 <- setClass("class_2", slots = list(letter = "character"), contains = "class_1")
  x <- class_2(number = 1, letter = "a")
  vld_s4_class(x, c("class_2"))
  vld_s4_class(x, c("class_1"))
})

test_that("chk_s4_class", {
  expect_identical(
    chk_s4_class(getClass("MethodDefinition"), "classRepresentation"),
    getClass("MethodDefinition"),
    "classRepresentation"
  )
  expect_invisible(chk_s4_class(
    getClass("MethodDefinition"),
    "classRepresentation"
  ))

  class_1 <- setClass("class_1", slots = list(number = "numeric"))
  class_2 <- setClass("class_2", slots = list(letter = "character"), contains = "class_1")
  x <- class_2(number = 1, letter = "a")
  expect_identical(chk_s4_class(x, c("class_2")), x)
  expect_identical(chk_s4_class(x, c("class_1")), x)
  expect_identical(chk_s4_class(x, c("class_1", "class_2")), x)
  expect_identical(chk_s4_class(x, c("class_1", "class_3")), x)
  # class(x) only returns "class_2" because it is an extension of "class_1"
  expect_error(chk_s4_class(x, c("class_3", "class_4")),
               "`x` must inherit from S4 classes 'class_3' or 'class_4', not S4 class 'class_2'.")

  expect_chk_error(
    chk_s4_class(1, "integer"),
    "^`1` must inherit from S4 class 'integer', not S3 class 'numeric'\\.$"
  )
  expect_chk_error(
    chk_s4_class(matrix(1), "numeric"),
    "`matrix\\(1\\)` must inherit from S4 class 'numeric', not S3 class 'matrix' and 'array'\\.$"
  )

  foo <- 1
  class(foo) <- "a"
  expect_chk_error(
    chk_s4_class(foo, c("b", "c")),
    "^`foo` must inherit from S4 classes 'b' or 'c', not S3 class 'a'\\.$"
  )
  class(foo) <- c("a", "z")
  expect_chk_error(
    chk_s4_class(foo, c("b", "c")),
    "^`foo` must inherit from S4 classes 'b' or 'c', not S3 class 'a' and 'z'\\.$"
  )
})
