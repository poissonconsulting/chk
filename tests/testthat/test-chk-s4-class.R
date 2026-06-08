test_that("vld_s4_class", {
  expect_false(vld_s4_class(1, "numeric"))
  expect_true(vld_s4_class(getClass("MethodDefinition"), "classRepresentation"))
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
  expect_chk_error(
    chk_s4_class(1, "integer"),
    "^`1` must inherit from S4 class 'integer'[.]$"
  )
  expect_chk_error(
    chk_s4_class(matrix(1), "numeric"),
    "`matrix[(]1[)]` must inherit from S4 class 'numeric'[.]$"
  )

  foo <- 1
  class(foo) <- "a"
  expect_chk_error(
    chk_s4_class(foo, c("b", "c")),
    "`foo` must inherit from S4 class 'b' or 'c'."
  )
})
