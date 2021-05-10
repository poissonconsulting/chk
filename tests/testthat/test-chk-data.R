test_that("vld_data", {
  expect_false(vld_data(1))
  expect_false(vld_data(array(1)))
  expect_true(vld_data(data.frame()))
  expect_true(vld_data(data.frame(x = 1)))
})

test_that("chk_data", {
  expect_identical(chk_data(data.frame()), data.frame())
  expect_invisible(chk_data(data.frame()))
  expect_chk_error(
    chk_data(1),
    "^`1` must be a data[.]frame[.]$"
  )
})
