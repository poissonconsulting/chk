<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# chk 0.8.0

- Updated deprecated argument `.subclass` to `class` in rlang function calls
- Added `chk_valid_name()`.
- Fixed `chk_join()` with `sf` data frames.

# chk 0.7.0

## Added

- Added `chkor_vld()` as faster replacement for soft-deprecated `chkor()`.
- Sped up `chk_null_or()` by soft-deprecating `chk` argument for `vld` argument.
- Un-deprecated `chk_count()` and `chk_length()` because so useful.
- Updated error messages to precede objects which are described by their class by 'the y object of class'.

## Fixed

- `chk_null_or()` now returns (invisible) x.

## Deprecated 

- Soft deprecated `chkor()` for `chkor_vld()` as slow.
- Soft deprecated `chk` argument of `chk_null_or()` for `vld` argument.
- Soft deprecated `chk_chr()`, `chk_dbl()` and `chk_wnum()` and `vld_` equivalents.
- Warn deprecated `chk_count()`, `chk_dirs()`, `chk_files()`, `chk_has()`, `chk_in()`, `chk_length()`, `chk_no_missing()`, `vld_no_missing()`, `chk_proportion()`
- Stop deprecated `chk_off()`, `chk_on()`, `is_chk_on()`,

# chk 0.6.0

- All `chk_xx()` functions now return invisible copy of x (if passes check).
- Fixed bug in `check_key()` and `check_data()` when key is undefined for `sf `objects.
- `chk_whole_numeric()` now accepts `Inf` values.
- Removed `LazyData: true` for DESCRIPTION file to avoid CRAN check note.

# chk 0.5.0

- Added `chk_null_or()`.
- Added `chk_wnum()` to check whole numeric scalars.
- Added `chk_dbl()` to check double scalars.
- Added `chk_chr()` to check character scalars.
- Added `chk_not_subset()` to check not a subset.
- Added `chk_factor()` to check factor vector.
- Added `chk_character_or_factor()` factor or character vector.
- Added `check_files()` and `check_dirs()` to check if all files or directories exist (or not).
- Added `chk_setordered()` to check order of elements in set.

- `check_values()` now checks factor levels.
- Undeprecated `chk_is()` as useful for R6 objects.
- Soft-deprecated `chk_datetime()` for `chk_date_time()`.

# chk 0.4.0

- Added following checks
  - `check_names()`.
  - `check_dim()`.
  - `check_values()`.
  - `check_key()`.
  - `check_data()`.

- Added following typeof chks
  - `chk_logical()` and `vld_logical()`.
  - `chk_double()` and `vld_double()`.
  - `chk_integer()` and `vld_integer()`.
  - `chk_character()` and `vld_character()`.

- Added miscellaneous chks
  - `chk_data()` and `vld_data()`.
  - `chk_join()`.
  
- Fixed
  - `chk_vector()` and `vld_vector()` so ignores attributes.

# chk 0.3.1

- Added `expect_chk_error()`.
- Added `chk_matrix()` and `vld_matrix()`.
- Added `chk_array()` and `vld_array()`.
- `abort_chk` now allows original arguments to be attached.
- Added `chk_tz()` and `vld_tz()`.
- Added `chk_matrix()` and `vld_matrix()`.
- Added `chk_array()` and `vld_array()`.
- Added `expect_chk_error()`.

# chk 0.3.0

- Added `chk_sorted()` and `vld_sorted()`.

# chk 0.2.1

## Minor Changes

- Removed `chk-benchmarking.Rmd` vignette that was causing problems for many CRAN checks.

# chk 0.2.0

## Major Changes

- Added `x_name = NULL` argument to relevant `chk_` functions.
- Replaced `err = FALSE` variant with `vld_` variant.
- Switched from `stop()`, `warning()` and `message()` to rlang variants `abort()`, `warn()` and `inform()`.
- All error messages now start with x_name.
- Err capitalizes first character and adds missing period (tidyverse style).

## New Functions

- `chk_all()`
- `chk_atomic()`
- `chk_environment()`
- `chk_ext()`
- `chk_has()`
- `chk_not_empty()`
- `chk_s3_class()`
- `chk_s4_class()`
- `chk_setequal()`

## Newly Exported Functions

- `backtick_chk()`
- `unbacktick_chk()`.

## New Arguments

- `formals` argument to `chk_function()`.
- `tidy = TRUE` argument to errors, warnings and messages.
- `n = NULL` and `call. = FALSE` args to error message generating functions.
- `ellipsis = 10L` argument to `cc()`.
- `sep = ", "` arg to `cc()`.
- `incomparables = FALSE` argument to `chk_unique()`.
- `%y` to sprintf-like types. 

## (Soft) Deprecated Functions

- `chk_no_missing()` for `chk_not_any_na()`. 
- `chk_files()` and `chk_dirs()` for `chk_all(x, chk_file)` etc.
- `deparse_backtick()` for `deparse_backtick_chk()`.

- `chk_length()`, `chk_proportion()` and `chk_count()`.
- `chk_on()`, `chk_off()` and `is_chk_on()`.

## Minor Changes

- Changed `chk_match()` so ignores missing values.
- Changed `chk_true()` (and `chk_false()`) to same behavior as `isTRUE` in R >= 3.5.
- Extended `chk_unique()` to handle `incomparables != FALSE` with data frames.
- Changed to `range = c(0,1)` for `chk_range()`.

# chk 0.0.1

- Initial release.
