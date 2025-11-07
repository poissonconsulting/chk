# Stop, Warning and Message Messages

The functions call
[`message_chk()`](https://poissonconsulting.github.io/chk/dev/reference/message_chk.md)
to process the message and then
[`rlang::abort()`](https://rlang.r-lib.org/reference/abort.html),
[`rlang::warn()`](https://rlang.r-lib.org/reference/abort.html) and
[`rlang::inform()`](https://rlang.r-lib.org/reference/abort.html),
respectively.

## Usage

``` r
err(
  ...,
  n = NULL,
  tidy = TRUE,
  .subclass = NULL,
  class = NULL,
  call = rlang::caller_call(3)
)

wrn(..., n = NULL, tidy = TRUE, .subclass = NULL, class = NULL)

msg(..., n = NULL, tidy = TRUE, .subclass = NULL, class = NULL)
```

## Arguments

- ...:

  zero or more objects which can be coerced to character (and which are
  pasted together with no separator) or a single condition object.

- n:

  The value of n for converting `sprintf`-like types.

- tidy:

  A flag specifying whether capitalize the first character and add a
  missing period.

- .subclass:

  A string of the class of the error message.

- class:

  Subclass of the condition.

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

## Details

The user can set the subclass.

## Functions

- `err()`: Error

- `wrn()`: Warning

- `msg()`: Message

## Examples

``` r
# err
try(err("there %r %n problem value%s", n = 2))
#> Error in evaluate::evaluate(code, child_env(env), new_device = TRUE, output_handler = output_handler) : 
#>   There are 2 problem values.

# wrn
wrn("there %r %n problem value%s", n = 2)
#> Warning: There are 2 problem values.

# msg
msg("there %r %n problem value%s", n = 2)
#> There are 2 problem values.
```
