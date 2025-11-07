# Abort Check

A wrapper on
[`err()`](https://poissonconsulting.github.io/chk/dev/reference/err.md)
that sets the subclass to be `'chk_error'`.

## Usage

``` r
abort_chk(..., n = NULL, tidy = TRUE, call = rlang::caller_call(2))
```

## Arguments

- ...:

  Multiple objects that are converted to a string using
  `paste0(..., collapse = '')`.

- n:

  The value of n for converting `sprintf`-like types.

- tidy:

  A flag specifying whether capitalize the first character and add a
  missing period.

- call:

  The execution environment of a currently running function, e.g.
  `call = caller_env()`. The corresponding function call is retrieved
  and mentioned in error messages as the source of the error.

  You only need to supply `call` when throwing a condition from a helper
  function which wouldn't be relevant to mention in the message.

  Can also be `NULL` or a [defused function
  call](https://rlang.r-lib.org/reference/topic-defuse.html) to
  respectively not display any call or hard-code a code to display.

  For more information about error calls, see [Including function calls
  in error
  messages](https://rlang.r-lib.org/reference/topic-error-call.html).

## Value

Throws an error of class `'chk_error'`.

## Details

It is exported to allow users to easily construct their own `chk_`
functions.

## See also

[`err()`](https://poissonconsulting.github.io/chk/dev/reference/err.md)

## Examples

``` r
try(abort_chk("x must be NULL"))
#> Error in eval(expr, envir) : X must be NULL.
try(abort_chk("`x` must be NULL"))
#> Error in eval(expr, envir) : `x` must be NULL.
try(abort_chk("there %r %n problem value%s", n = 1))
#> Error in eval(expr, envir) : There is 1 problem value.
try(abort_chk("there %r %n problem value%s", n = 1.5))
#> Error in eval(expr, envir) : There are 1.5 problem values.
```
