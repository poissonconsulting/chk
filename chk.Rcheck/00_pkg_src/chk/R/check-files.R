#' Check Files Exist
#'
#' @description
#' Checks if all files exist (or if exists = FALSE do not exist as files or directories).
#'
#' @inheritParams params
#' @return An informative error if the test fails or an invisible copy of x.
#'
#' @family check
#'
#' @examples
#' check_files(tempfile("unlikely-that-exists-chk"), exists = FALSE)
#' try(check_files(tempfile("unlikely-that-exists-chk")))
#' @export
check_files <- function(x, exists = TRUE, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_character(x, x_name = x_name)
  chk_vector(x, x_name = x_name)
  chk_not_any_na(x, x_name = x_name)
  chk_flag(exists)

  dirs <- vapply(x, vld_dir, TRUE)
  if (any(dirs)) {
    abort_chk(x_name, " must specify files ('", x[dirs][1], "' is a directory)", x = x)
  }
  x <- x[vapply(x, vld_file, TRUE) != exists]
  if (!length(x)) {
    return(invisible(x))
  }
  x <- x[1]
  if (exists) {
    abort_chk(x_name, " must specify existing files ('", x, "' can't be found)", x = x)
  }
  abort_chk(x_name, " must not specify existing files ('", x, "' exists)", x = x)
}
