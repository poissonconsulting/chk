expect_chk_error <- function(call, message, subclass) {
  class <- c(subclass, "chk_error")
  expect_error(call, message, class = class)
}
