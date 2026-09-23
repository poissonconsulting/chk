<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# chk 0.11.0.9000

- Switching to development version.


# chk 0.11.0

## Breaking changes

- chk now requires R >= 4.1.

- `check_data()` and `check_values()` now require the levels of a factor column to be identical (including order) to the levels of `values` whenever `values` has two or more levels; previously two levels only required an ordered superset (#297).

- `check_data()` and `check_values()` now require all values of a column to be missing when the corresponding `values` are all missing.

## New features

- New `chk_all_na()` and `vld_all_na()` check that all values are missing (#299).

- New `chk_class()` and `vld_class()` check that an object inherits from a class using `inherits()` regardless of the object system.

- New `chk_s3_class_strict()` and `vld_s3_class_strict()` check that an object is an S3 object of the given class (excluding S4, R5, R6 and S7 objects).

- New `chk_r6_class()` and `vld_r6_class()` check that an object is an R6 object of the given class (#306).

- New `generate_check_data()` generates the code for a `check_data()` call from an example data frame (#124).

- `chk_s3_class()` and `chk_s4_class()` errors now state the class(es) of the object to help diagnose issues.

- `chkor_vld()` gains an `x_name` argument that is passed to each of the underlying `chk_` calls, so the error message refers to `x_name` rather than the deparsed `vld_` arguments (#100).

- `vld_s4_class()` is now vectorized over `class` like `vld_s3_class()`, so `chk_s4_class()` accepts multiple classes.

- `message_chk()` gains a `%es` `sprintf`-like type (for pluralizing words such as class/classes) and treats `%%` as an escape for a literal '%' (#310).

- `p()` and `p0()` gain a `recycle0` argument that is passed to `paste()` and `paste0()` (#307).

## Bug fixes

- `check_data()` now names the offending argument when passed a non-data frame, instead of reporting "data.frame".

- `chk_lte()` now sets the `x` and `value` fields on its condition for scalar input, consistent with `chk_gte()`, `chk_lt()` and `chk_gt()`.

- `chk_null_or()` now resolves the matching `chk_` function by direct lookup (including `chk_`/`vld_` pairs defined in other packages) rather than by `parse()`/`eval()`, and falls back to an informative message when no partner can be found (#97).

- `deparse_backtick_chk()` now uses `deparse1()` so that `x_name` is a string for arguments whose expressions deparse over multiple lines; previously such calls failed with `` `x_name` must be a string `` (#300).

## Documentation

- `check_data()` now documents that it does not check for duplicate rows and that `unique()` should be used to detect them (#309).

# chk 0.10.0

- Added `chk_complex()` and `vld_complex()`. (#158).
- Added `chk_raw()` and `vld_raw()` (#157).
- Added `check_length()`.
- Soft-deprecated `chk_lgl()` for `chk_scalar()` and `chk_logical()`.
- Fixed nested backticks so that error messages only have one set of backticks.

# chk 0.9.2

- No longer officially supports R 3.6 as dependency `evaluate` of suggested dependency `testthat` switched to 4.0.
- `check_key()` now preserves active status of `sfc` column of `sf` object.
- Fixed `vld_join(by = NULL)` with R 4.5.

# chk 0.9.1

- Fixes incorrect error message with `chk_null_or()` when `vld = chk::vld_xx`.


# chk 0.9.0

- Added `chk_compatible_lengths()` and `vld_compatible_lengths()` to check that lengths of objects are 'strictly recyclable'.
- Added `inclusive = TRUE` argument to `chk_range()`.
- Added `upper` argument to `chk_length()`.
- `vld_sorted()` and `chk_sorted()` now ignore missing values.
- Soft deprecated `.subclass` for `class` argument in `err()`, `wrn()` and `msg()`.


# chk 0.8.1

- Fixed bug where`check_key()` failing on sf objects.


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
