- Switched from `stop()`, `warning()` and `message()` to `abort()`, `warn()` and `inform()`.
- Replaced `err = FALSE` variant with `vld_` variant.
- Extended `chk_unique()` to handle `incomparables != FALSE` with data frames.
- Added `chk_has()` function.
- Added `n = NULL` and `call. = FALSE` args to error message generating funcions.
- Added `ellipsis = 10L` argument to `cc()`.
- Added `sep = ", "` arg to `cc()`.
- Changed to `range = c(0,1)` for `chk_range()`.
- Deprecated `chk_length()`, `chk_proportion()` and `chk_count()`.
- Added `incomparables = FALSE` argument to `chk_unique()`.
- Added `chk_all()` function.
- Added `x_name = NULL` argument to relevant `chk_` functions.
- Deprecated `chk_files()` and `chk_dirs()` for `chk_file()` and `chk_dir()`.
which now handle vectors.
- All error messages except `chk_file()` and `chk_dir()` now start with x_name.

# chk 0.0.1

- Initial release.
