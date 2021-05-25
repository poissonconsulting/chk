# chk 0.5.1.9003

- `chk_whole_numeric()` now handle Inf values.


# chk 0.5.1.9002

- All `check_xx()` functions with a `chk_xx()` equivalent removed
- All `chk_xx()` now return x
- `chk_atomic()` now returns x and removed `check_atomic()`.
- `chk_data()` now returns input object


# chk 0.5.1.9001
- Added following check functions which return invisible copy of original object to be used in pipes.
  - `check_all_equal()`
  - `check_all_equivalent()`
  - `check_all()`
  - `check_array()`
  - `check_atomic()`
  - `check_character_or_factor()`
  - `check_character()`
  - `check_chr()`
  - `check_data()`
  - `check_date()`
  - `check_datetime()`
  - `check_dbl()`
  - `check_dir()`
  - `check_double()`
  - `check_environment()`
  - `check_equal()`
  - `check_equivalent()`
  - `check_ext()`
  - `check_factor()`
  - `check_false()`
  - `check_file()`
  - `check_flag()`
  - `check_function()`
  - `check_gt()`
  - `check_gte()`
  - `check_identical()`
  - `check_integer()`
  - `check_is()`
  - `check_join()`
  - `check_lgl()`
  - `check_list()`
  - `check_logical()`
  - `check_lt()`
  - `check_lte()`
  - `check_match()`
  - `check_matrix()`
  - `check_named()`
  - `check_not_any_na()`
  - `check_not_empty()` 
  - `check_not_null()`
  - `check_not_subset()`
  - `check_null_or()`
  - `check_null()`
  - `check_number()`
  - `check_numeric()`
  - `check_orderset()`
  - `check_range()`
  - `check_s3_class()`
  - `check_s4_class()`
  - `check_scalar()`
  - `check_setequal()`
  - `check_sorted()`
  - `check_string()`
  - `check_subset()`
  - `check_superset()`
  - `check_true()`
  - `check_tz()`
  - `check_unique()`
  - `check_vector()`
  - `check_whole_number()`
  - `check_whole_numeric()`
  - `check_wnum()`
  
- Modified following checks to return invisible copy of original object
  - `check_data()`.
  - `check_dim()`.
  - `check_dirs()`.
  - `check_files()`.
  - `check_key()`.
  - `check_names()`.
  - `check_values()`.
- Fix bug in `check_key()` and `check_data()` when key is undefined for `sf `objects.


# chk 0.5.1.9000

- Same as previous version.


# chk 0.5.1

- Internal changes only.

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
