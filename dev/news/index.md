# Changelog

## chk 0.10.0.9014

### Continuous integration

- Ignore rmarkdown before R 4.1, rappdirs needs R 4.1.

## chk 0.10.0.9013

### Chore

- Format with air
  ([\#210](https://github.com/poissonconsulting/chk/issues/210)).

### Continuous integration

- Fix checking without testthat.

## chk 0.10.0.9012

### Continuous integration

- Install binaries from r-universe for dev workflow
  ([\#206](https://github.com/poissonconsulting/chk/issues/206)).

## chk 0.10.0.9011

### Continuous integration

- Fix reviewdog and add commenting workflow
  ([\#204](https://github.com/poissonconsulting/chk/issues/204)).

## chk 0.10.0.9010

### Continuous integration

- Use workflows for fledge
  ([\#202](https://github.com/poissonconsulting/chk/issues/202)).

## chk 0.10.0.9009

### Continuous integration

- Sync ([\#200](https://github.com/poissonconsulting/chk/issues/200)).

## chk 0.10.0.9008

### Chore

- Auto-update from GitHub Actions
  ([\#194](https://github.com/poissonconsulting/chk/issues/194)).

### Continuous integration

- Use reviewdog for external PRs
  ([\#195](https://github.com/poissonconsulting/chk/issues/195)).

## chk 0.10.0.9007

### Continuous integration

- Format with air, check detritus, better handling of `extra-packages`
  ([\#192](https://github.com/poissonconsulting/chk/issues/192)).

## chk 0.10.0.9006

- Remove internal str2lang() function.
  ([\#97](https://github.com/poissonconsulting/chk/issues/97),
  [\#189](https://github.com/poissonconsulting/chk/issues/189)).

## chk 0.10.0.9005

- Merge pull request
  [\#187](https://github.com/poissonconsulting/chk/issues/187) from
  poissonconsulting/chkiserrmsg.

- Add R 4.0.

## chk 0.10.0.9004

### Continuous integration

- Enhance permissions for workflow
  ([\#183](https://github.com/poissonconsulting/chk/issues/183)).

## chk 0.10.0.9003

### Continuous integration

- Permissions, better tests for missing suggests, lints
  ([\#181](https://github.com/poissonconsulting/chk/issues/181)).

## chk 0.10.0.9002

### Continuous integration

- Always use `_R_CHECK_FORCE_SUGGESTS_=false`
  ([\#178](https://github.com/poissonconsulting/chk/issues/178)).

### fledge

- Bump version to 0.10.0.9001
  ([\#176](https://github.com/poissonconsulting/chk/issues/176)).

## chk 0.10.0.9001

### Continuous integration

- Correct installation of xml2
  ([\#175](https://github.com/poissonconsulting/chk/issues/175)).

- Sync ([\#173](https://github.com/poissonconsulting/chk/issues/173)).

## chk 0.10.0.9000

- Switching to development version.

## chk 0.10.0

CRAN release: 2025-01-24

- Added
  [`chk_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md)
  and
  [`vld_complex()`](https://poissonconsulting.github.io/chk/dev/reference/chk_complex.md).
  ([\#158](https://github.com/poissonconsulting/chk/issues/158)).
- Added
  [`chk_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)
  and
  [`vld_raw()`](https://poissonconsulting.github.io/chk/dev/reference/chk_raw.md)
  ([\#157](https://github.com/poissonconsulting/chk/issues/157)).
- Added
  [`check_length()`](https://poissonconsulting.github.io/chk/dev/reference/check_length.md).
- Soft-deprecated
  [`chk_lgl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_lgl.md)
  for
  [`chk_scalar()`](https://poissonconsulting.github.io/chk/dev/reference/chk_scalar.md)
  and
  [`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md).
- Fixed nested backticks so that error messages only have one set of
  backticks.

## chk 0.9.2

CRAN release: 2024-07-09

- No longer officially supports R 3.6 as dependency `evaluate` of
  suggested dependency `testthat` switched to 4.0.
- [`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md)
  now preserves active status of `sfc` column of `sf` object.
- Fixed `vld_join(by = NULL)` with R 4.5.

## chk 0.9.1

CRAN release: 2023-10-06

- Fixes incorrect error message with
  [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)
  when `vld = chk::vld_xx`.

## chk 0.9.0

CRAN release: 2023-05-27

- Added
  [`chk_compatible_lengths()`](https://poissonconsulting.github.io/chk/dev/reference/chk_compatible_lengths.md)
  and
  [`vld_compatible_lengths()`](https://poissonconsulting.github.io/chk/dev/reference/chk_compatible_lengths.md)
  to check that lengths of objects are ‘strictly recyclable’.
- Added `inclusive = TRUE` argument to
  [`chk_range()`](https://poissonconsulting.github.io/chk/dev/reference/chk_range.md).
- Added `upper` argument to
  [`chk_length()`](https://poissonconsulting.github.io/chk/dev/reference/chk_length.md).
- [`vld_sorted()`](https://poissonconsulting.github.io/chk/dev/reference/chk_sorted.md)
  and
  [`chk_sorted()`](https://poissonconsulting.github.io/chk/dev/reference/chk_sorted.md)
  now ignore missing values.
- Soft deprecated `.subclass` for `class` argument in
  [`err()`](https://poissonconsulting.github.io/chk/dev/reference/err.md),
  [`wrn()`](https://poissonconsulting.github.io/chk/dev/reference/err.md)
  and
  [`msg()`](https://poissonconsulting.github.io/chk/dev/reference/err.md).

## chk 0.8.1

CRAN release: 2022-08-26

- Fixed bug
  where[`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md)
  failing on sf objects.

## chk 0.8.0

CRAN release: 2022-02-05

- Updated deprecated argument `.subclass` to `class` in rlang function
  calls
- Added
  [`chk_valid_name()`](https://poissonconsulting.github.io/chk/dev/reference/chk_valid_name.md).
- Fixed
  [`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md)
  with `sf` data frames.

## chk 0.7.0

CRAN release: 2021-09-03

### Added

- Added
  [`chkor_vld()`](https://poissonconsulting.github.io/chk/dev/reference/chkor_vld.md)
  as faster replacement for soft-deprecated
  [`chkor()`](https://poissonconsulting.github.io/chk/dev/reference/chkor.md).
- Sped up
  [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)
  by soft-deprecating `chk` argument for `vld` argument.
- Un-deprecated
  [`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md)
  and
  [`chk_length()`](https://poissonconsulting.github.io/chk/dev/reference/chk_length.md)
  because so useful.
- Updated error messages to precede objects which are described by their
  class by ‘the y object of class’.

### Fixed

- [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)
  now returns (invisible) x.

### Deprecated

- Soft deprecated
  [`chkor()`](https://poissonconsulting.github.io/chk/dev/reference/chkor.md)
  for
  [`chkor_vld()`](https://poissonconsulting.github.io/chk/dev/reference/chkor_vld.md)
  as slow.
- Soft deprecated `chk` argument of
  [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md)
  for `vld` argument.
- Soft deprecated
  [`chk_chr()`](https://poissonconsulting.github.io/chk/dev/reference/chk_chr.md),
  [`chk_dbl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dbl.md)
  and
  [`chk_wnum()`](https://poissonconsulting.github.io/chk/dev/reference/chk_wnum.md)
  and `vld_` equivalents.
- Warn deprecated
  [`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md),
  [`chk_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_files()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_has()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_in()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_length()`](https://poissonconsulting.github.io/chk/dev/reference/chk_length.md),
  [`chk_no_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`vld_no_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_proportion()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
- Stop deprecated
  [`chk_off()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_on()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`is_chk_on()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),

## chk 0.6.0

CRAN release: 2021-07-04

- All `chk_xx()` functions now return invisible copy of x (if passes
  check).
- Fixed bug in
  [`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md)
  and
  [`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md)
  when key is undefined for `sf`objects.
- [`chk_whole_numeric()`](https://poissonconsulting.github.io/chk/dev/reference/chk_whole_numeric.md)
  now accepts `Inf` values.
- Removed `LazyData: true` for DESCRIPTION file to avoid CRAN check
  note.

## chk 0.5.0

CRAN release: 2020-05-29

- Added
  [`chk_null_or()`](https://poissonconsulting.github.io/chk/dev/reference/chk_null_or.md).

- Added
  [`chk_wnum()`](https://poissonconsulting.github.io/chk/dev/reference/chk_wnum.md)
  to check whole numeric scalars.

- Added
  [`chk_dbl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dbl.md)
  to check double scalars.

- Added
  [`chk_chr()`](https://poissonconsulting.github.io/chk/dev/reference/chk_chr.md)
  to check character scalars.

- Added
  [`chk_not_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_subset.md)
  to check not a subset.

- Added
  [`chk_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_factor.md)
  to check factor vector.

- Added
  [`chk_character_or_factor()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character_or_factor.md)
  factor or character vector.

- Added
  [`check_files()`](https://poissonconsulting.github.io/chk/dev/reference/check_files.md)
  and
  [`check_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/check_dirs.md)
  to check if all files or directories exist (or not).

- Added `chk_setordered()` to check order of elements in set.

- [`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md)
  now checks factor levels.

- Undeprecated
  [`chk_is()`](https://poissonconsulting.github.io/chk/dev/reference/chk_is.md)
  as useful for R6 objects.

- Soft-deprecated
  [`chk_datetime()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md)
  for
  [`chk_date_time()`](https://poissonconsulting.github.io/chk/dev/reference/chk_date_time.md).

## chk 0.4.0

CRAN release: 2020-03-04

- Added following checks
  - [`check_names()`](https://poissonconsulting.github.io/chk/dev/reference/check_names.md).
  - [`check_dim()`](https://poissonconsulting.github.io/chk/dev/reference/check_dim.md).
  - [`check_values()`](https://poissonconsulting.github.io/chk/dev/reference/check_values.md).
  - [`check_key()`](https://poissonconsulting.github.io/chk/dev/reference/check_key.md).
  - [`check_data()`](https://poissonconsulting.github.io/chk/dev/reference/check_data.md).
- Added following typeof chks
  - [`chk_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md)
    and
    [`vld_logical()`](https://poissonconsulting.github.io/chk/dev/reference/chk_logical.md).
  - [`chk_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md)
    and
    [`vld_double()`](https://poissonconsulting.github.io/chk/dev/reference/chk_double.md).
  - [`chk_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md)
    and
    [`vld_integer()`](https://poissonconsulting.github.io/chk/dev/reference/chk_integer.md).
  - [`chk_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md)
    and
    [`vld_character()`](https://poissonconsulting.github.io/chk/dev/reference/chk_character.md).
- Added miscellaneous chks
  - [`chk_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md)
    and
    [`vld_data()`](https://poissonconsulting.github.io/chk/dev/reference/chk_data.md).
  - [`chk_join()`](https://poissonconsulting.github.io/chk/dev/reference/chk_join.md).
- Fixed
  - [`chk_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)
    and
    [`vld_vector()`](https://poissonconsulting.github.io/chk/dev/reference/chk_vector.md)
    so ignores attributes.

## chk 0.3.1

CRAN release: 2020-02-05

- Added
  [`expect_chk_error()`](https://poissonconsulting.github.io/chk/dev/reference/expect_chk_error.md).
- Added
  [`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md)
  and
  [`vld_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md).
- Added
  [`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md)
  and
  [`vld_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md).
- `abort_chk` now allows original arguments to be attached.
- Added
  [`chk_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md)
  and
  [`vld_tz()`](https://poissonconsulting.github.io/chk/dev/reference/chk_tz.md).
- Added
  [`chk_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md)
  and
  [`vld_matrix()`](https://poissonconsulting.github.io/chk/dev/reference/chk_matrix.md).
- Added
  [`chk_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md)
  and
  [`vld_array()`](https://poissonconsulting.github.io/chk/dev/reference/chk_array.md).
- Added
  [`expect_chk_error()`](https://poissonconsulting.github.io/chk/dev/reference/expect_chk_error.md).

## chk 0.3.0

CRAN release: 2020-01-15

- Added
  [`chk_sorted()`](https://poissonconsulting.github.io/chk/dev/reference/chk_sorted.md)
  and
  [`vld_sorted()`](https://poissonconsulting.github.io/chk/dev/reference/chk_sorted.md).

## chk 0.2.1

CRAN release: 2019-11-26

### Minor Changes

- Removed `chk-benchmarking.Rmd` vignette that was causing problems for
  many CRAN checks.

## chk 0.2.0

CRAN release: 2019-11-15

### Major Changes

- Added `x_name = NULL` argument to relevant `chk_` functions.
- Replaced `err = FALSE` variant with `vld_` variant.
- Switched from [`stop()`](https://rdrr.io/r/base/stop.html),
  [`warning()`](https://rdrr.io/r/base/warning.html) and
  [`message()`](https://rdrr.io/r/base/message.html) to rlang variants
  `abort()`, `warn()` and `inform()`.
- All error messages now start with x_name.
- Err capitalizes first character and adds missing period (tidyverse
  style).

### New Functions

- [`chk_all()`](https://poissonconsulting.github.io/chk/dev/reference/chk_all.md)
- [`chk_atomic()`](https://poissonconsulting.github.io/chk/dev/reference/chk_atomic.md)
- [`chk_environment()`](https://poissonconsulting.github.io/chk/dev/reference/chk_environment.md)
- [`chk_ext()`](https://poissonconsulting.github.io/chk/dev/reference/chk_ext.md)
- [`chk_has()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
- [`chk_not_empty()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_empty.md)
- [`chk_s3_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s3_class.md)
- [`chk_s4_class()`](https://poissonconsulting.github.io/chk/dev/reference/chk_s4_class.md)
- [`chk_setequal()`](https://poissonconsulting.github.io/chk/dev/reference/chk_setequal.md)

### Newly Exported Functions

- [`backtick_chk()`](https://poissonconsulting.github.io/chk/dev/reference/deparse_backtick_chk.md)
- [`unbacktick_chk()`](https://poissonconsulting.github.io/chk/dev/reference/deparse_backtick_chk.md).

### New Arguments

- `formals` argument to
  [`chk_function()`](https://poissonconsulting.github.io/chk/dev/reference/chk_function.md).
- `tidy = TRUE` argument to errors, warnings and messages.
- `n = NULL` and `call. = FALSE` args to error message generating
  functions.
- `ellipsis = 10L` argument to
  [`cc()`](https://poissonconsulting.github.io/chk/dev/reference/cc.md).
- `sep = ", "` arg to
  [`cc()`](https://poissonconsulting.github.io/chk/dev/reference/cc.md).
- `incomparables = FALSE` argument to
  [`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md).
- `%y` to sprintf-like types.

### (Soft) Deprecated Functions

- [`chk_no_missing()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  for
  [`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md).

- [`chk_files()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  and
  [`chk_dirs()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  for `chk_all(x, chk_file)` etc.

- [`deparse_backtick()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  for
  [`deparse_backtick_chk()`](https://poissonconsulting.github.io/chk/dev/reference/deparse_backtick_chk.md).

- [`chk_length()`](https://poissonconsulting.github.io/chk/dev/reference/chk_length.md),
  [`chk_proportion()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  and
  [`chk_count()`](https://poissonconsulting.github.io/chk/dev/reference/chk_count.md).

- [`chk_on()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md),
  [`chk_off()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md)
  and
  [`is_chk_on()`](https://poissonconsulting.github.io/chk/dev/reference/chk_deprecated.md).

### Minor Changes

- Changed
  [`chk_match()`](https://poissonconsulting.github.io/chk/dev/reference/chk_match.md)
  so ignores missing values.
- Changed
  [`chk_true()`](https://poissonconsulting.github.io/chk/dev/reference/chk_true.md)
  (and
  [`chk_false()`](https://poissonconsulting.github.io/chk/dev/reference/chk_false.md))
  to same behavior as `isTRUE` in R \>= 3.5.
- Extended
  [`chk_unique()`](https://poissonconsulting.github.io/chk/dev/reference/chk_unique.md)
  to handle `incomparables != FALSE` with data frames.
- Changed to `range = c(0,1)` for
  [`chk_range()`](https://poissonconsulting.github.io/chk/dev/reference/chk_range.md).

## chk 0.0.1

- Initial release.
