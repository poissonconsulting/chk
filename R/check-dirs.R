#' Check Directories Exist
#'
#' @description
#' Checks if all directories exist (or if exists = FALSE do not exist as directories or files).
#'
#' @inheritParams params
#' @return An informative error if the test fails.
#'
#' @family check
#'
#' @examples
#' check_dirs(tempdir())
#' try(check_dirs(tempdir(), exists = FALSE))
#' @export
check_dirs <- function(x, exists = TRUE, x_name = NULL) {
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_string(x_name)
  chk_character(x, x_name = x_name)
  chk_vector(x, x_name = x_name)
  chk_not_any_na(x, x_name = x_name)
  chk_flag(exists)

  dirs <- vapply(x, vld_file, TRUE)
  if(any(dirs)) {
    abort_chk(x_name, " must specify directories ('", x[dirs][1], "' is a file)", x = x)
  }
  x <- x[vapply(x, vld_dir, TRUE) != exists]
  if(!length(x)) return(invisible())
  x <- x[1]
  if(exists) {
    abort_chk(x_name, " must specify existing directories ('", x, "' can't be found)", x = x)
  }
  abort_chk(x_name, " must not specify existing directories ('", x, "' exists)", x = x)
}
