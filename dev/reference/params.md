# Parameter Descriptions for chk Package

Default parameter descriptions which may be overridden in individual
functions.

## Arguments

- ...:

  Additional arguments.

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

- y:

  An object to check against.

- chk:

  A flag specifying whether to check the other parameters.

- chk_fun:

  A chk\_ function.

- tolerance:

  A non-negative numeric scalar.

- ext:

  A character vector of the permitted file extensions (without the .).

- exists:

  A flag specifying whether the files/directories must (or must not)
  exist.

- value:

  A non-missing scalar of a value.

- range:

  A non-missing sorted vector of length 2 of the lower and upper
  permitted values.

- inclusive:

  A flag specifying whether the range is exclusive.

- regexp:

  A string of a regular expression.

- values:

  A vector of the permitted values.

- class:

  A character vector specifying the possible class values.

- length:

  A count of the length.

- upper:

  A count of the max length.

- formals:

  A count of the number of formal arguments.

- incomparables:

  A vector of values that cannot be compared. FALSE means that all
  values can be compared.

- by:

  A character vector specifying the column names to join x and y on. If
  named the names are the corresponding columns in x.

- exclusive:

  A flag specifying whether x must only include columns named in values.

- order:

  A flag specifying whether the order of columns in x must match names
  in values.

- nrow:

  A flag or a whole numeric vector of the value, value range or possible
  values.

- key:

  A character vector of the columns that represent a unique key.

- vld_fun:

  A vld\_ function.

## Value

The `chk_` function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The `vld_` function returns a flag indicating whether the test was met.

## Details

A flag is a non-missing logical scalar.

A string is a non-missing character scalar.
