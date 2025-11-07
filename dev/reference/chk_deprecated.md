# Deprecated functions

Deprecated `chk_()` functions.

## Usage

``` r
chk_dirs(x)

chk_files(x)

chk_has(x, values, x_name = NULL)

chk_in(x, values, x_name = NULL)

chk_no_missing(x, x_name = NULL)

vld_no_missing(x)

chk_off()

chk_on()

is_chk_on()

chk_proportion(x, x_name = NULL)

deparse_backtick(x)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Functions

- `chk_dirs()`: Check Directories Exist

  **\[deprecated\]**

  Replace with `[chk_all](x, [chk_dir])`

- `chk_files()`: Check Files Exist

  **\[deprecated\]**

  Replace with `[chk_all](x, [chk_file])`

- `chk_has()`: Check Has

  **\[deprecated\]**

  Replace by
  [`chk_superset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_superset.md)

- `chk_in()`: Check In

  **\[deprecated\]**

  Replace by
  [`chk_subset()`](https://poissonconsulting.github.io/chk/dev/reference/chk_subset.md)

- `chk_no_missing()`: Check No Missing Values

  **\[deprecated\]**

  Replace with
  [`chk_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md)

- `vld_no_missing()`: Validate No Missing Values

  **\[deprecated\]**

  Replace with
  [`vld_not_any_na()`](https://poissonconsulting.github.io/chk/dev/reference/chk_not_any_na.md)

- `chk_off()`: Turns checking off

  **\[deprecated\]**

  This approach is no longer recommended

- `chk_on()`: Turns checking on

  **\[deprecated\]**

  This approach is no longer recommended

- `is_chk_on()`: Tests checking on

  **\[deprecated\]**

  This approach is no longer recommended

- `chk_proportion()`: Check Proportion

  **\[deprecated\]**

  Replace by `[chk_number](x); [chk_range](x)`

- `deparse_backtick()`: Deparse Backtick

  **\[deprecated\]**

  Replace with
  [`deparse_backtick_chk()`](https://poissonconsulting.github.io/chk/dev/reference/deparse_backtick_chk.md)

## See also

Other deprecated:
[`chk_chr()`](https://poissonconsulting.github.io/chk/dev/reference/chk_chr.md),
[`chk_dbl()`](https://poissonconsulting.github.io/chk/dev/reference/chk_dbl.md),
[`chk_wnum()`](https://poissonconsulting.github.io/chk/dev/reference/chk_wnum.md)
