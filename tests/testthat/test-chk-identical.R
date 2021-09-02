test_that("vld_identical", {
  expect_true(vld_identical(1, 1))
  expect_true(vld_identical(1L, 1L))
  expect_false(vld_identical(1, 1L))
  expect_false(vld_identical(1L, 1))

  expect_true(vld_identical(c(1L), 1L))
  expect_false(vld_identical(c(x = 1L), 1L))
  expect_false(vld_identical(1L, c(x = 1L)))
})

test_that("chk_identical", {
  expect_identical(chk_identical(1, 1), 1, 1)
  expect_invisible(chk_identical(1, 1))
  expect_chk_error(
    chk_identical(1L, 2),
    "^`1L` must be identical to 2[.]\n"
  )

  expect_chk_error(chk_identical(1, 1L), "^`1` must be identical to 1L[.]\n")
  expect_chk_error(
    chk_identical(1, 1:10),
    "^`1` must be identical to the y object of class [<]int[>][.]\n"
  )
  expect_chk_error(
    chk_identical(1, 1:100),
    "^`1` must be identical to the y object of class [<]int[>][.]\n"
  )
  expect_chk_error(
    chk_identical(1, c(1, 5, 1, 9)),
    "^`1` must be identical to the y object of class [<]dbl[>][.]\n"
  )
  expect_chk_error(
    chk_identical(1, 2, x_name = 2),
    "^2 must be identical to 2[.]\n"
  )
})


test_that("vld_equal", {
  expect_true(vld_equal(1, 1))
  expect_true(vld_equal(1L, 1L))
  expect_true(vld_equal(1, 1L))
  expect_true(vld_equal(1L, 1))

  expect_true(vld_equal(c(1L), 1L))
  expect_false(vld_equal(c(x = 1L), 1L))
  expect_false(vld_equal(1L, c(x = 1L)))

  expect_true(vld_equal(1, 1.00000001))
  expect_true(vld_equal(1, 1.001, 0.01))
  expect_true(vld_equal(1, 1.001, 0.001))

  expect_false(vld_equal(1, 1.001, 0.0001))
})

test_that("chk_equal", {
  expect_identical(chk_equal(1, 1), 1, 1)
  expect_invisible(chk_equal(1, 1))
  expect_chk_error(
    chk_equal(c(x = 1L), 1L),
    "^`c[(]x = 1L[)]` must be equal to 1L[.]\n"
  )
  expect_chk_error(
    chk_equal(1L, 2),
    "^`1L` must be equal to 2[.]\n"
  )
  expect_chk_error(
    chk_equal(1, c(1, 5, 1, 9)),
    "^`1` must be equal to the y object of class [<]dbl[>][.]\n"
  )
  expect_chk_error(
    chk_equal(1, 2, x_name = 2),
    "^2 must be equal to 2[.]\n"
  )
})

test_that("vld_equivalent", {
  expect_true(vld_equivalent(1, 1))
  expect_true(vld_equivalent(1L, 1L))
  expect_true(vld_equivalent(1, 1L))
  expect_true(vld_equivalent(1L, 1))

  expect_true(vld_equivalent(c(1L), 1L))
  expect_true(vld_equivalent(c(x = 1L), 1L))
  expect_true(vld_equivalent(c(x = 1L), 1L))
  expect_true(vld_equivalent(1L, c(x = 1L)))
  expect_true(vld_equivalent(1L, c(x = 1L)))

  expect_true(vld_equivalent(1, 1.00000001))
  expect_true(vld_equivalent(1, 1.001, 0.01))
  expect_true(vld_equivalent(1, 1.001, 0.001))

  expect_false(vld_equivalent(1, 1.001, 0.0001))
})

test_that("chk_equivalent", {
  expect_identical(chk_equivalent(1, 1), 1, 1)
  expect_invisible(chk_equivalent(1, 1))
  expect_chk_error(chk_equivalent(1, 1.001, 0.0001), c("^`1` must be equivalent to 1[.]001[.]\n"))
  expect_chk_error(
    chk_equivalent(1, c(1, 5, 1, 9)),
    "^`1` must be equivalent to the y object of class [<]dbl[>][.]\n"
  )
  expect_chk_error(
    chk_equivalent(1, 2, x_name = 2),
    "^2 must be equivalent to 2[.]\n"
  )
})
