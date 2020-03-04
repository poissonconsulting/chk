test_that("vld_join", {
  expect_true(vld_join(data.frame(z = 1), data.frame(z = 1:2), by = "z"))
  expect_false(vld_join(data.frame(z = 1), data.frame(z = 2), by = "z"))
})

test_that("vld_join with by = NULL", {
  expect_false(vld_join(data.frame(z = 1), data.frame(z = 1:2), by = NULL))
})

test_that("vld_join with names", {
  expect_true(vld_join(data.frame(z = 1), data.frame(a = 1:2), by = c(z = "a")))
  expect_false(vld_join(data.frame(z = 1), data.frame(a = 2), by = c(z = "a")))
  expect_error(
    vld_join(data.frame(z = 1), data.frame(a = 2), by = c(a = "z")),
    "undefined columns selected"
  )
  expect_true(vld_join(data.frame(z = 1, z2 = 2), data.frame(z = 1:2, z2 = 2:1), by = "z"))
  expect_true(vld_join(data.frame(z = 1, z2 = 2), data.frame(z = 1:2, z2 = 2:1), by = c("z", "z2")))
  expect_true(vld_join(data.frame(z = 1, z2 = 2), data.frame(z = 1:2, z2 = 1:2), by = "z"))
  expect_false(vld_join(data.frame(z = 1, z2 = 2), data.frame(z = 1:2, z2 = 1:2), by = c("z", "z2")))
})

test_that("vld_join with zero length", {
  expect_true(vld_join(data.frame(z = numeric(0)), data.frame(z = 2), by = c("z")))
  expect_true(vld_join(data.frame(z = numeric(0)), data.frame(z = numeric(0)), by = c("z")))
  expect_false(vld_join(data.frame(z = 1), data.frame(z = numeric(0)), by = c("z")))
})

test_that("vld_join with missing values", {
  expect_false(vld_join(data.frame(z = NA_integer_), data.frame(z = 2), by = c("z")))
  expect_false(vld_join(data.frame(z = 2), data.frame(z = NA_integer_), by = c("z")))
  expect_true(vld_join(data.frame(z = NA_integer_), data.frame(z = NA_integer_), by = c("z")))
})

test_that("chk_join", {
  expect_null(chk_join(data.frame(z = 1), data.frame(z = 1), by = "z"))
  expect_invisible(chk_join(data.frame(z = 1), data.frame(z = 1), by = "z"))
  expect_chk_error(
    chk_join(data.frame(z = 1), data.frame(z = 2), by = "z"),
    "^All rows in `data.frame[(]z [=] 1[)]` must match at least one in: <data.frame>."
  )
})
