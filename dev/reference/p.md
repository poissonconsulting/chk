# Concatenate Strings

A wrapper on [`base::paste()`](https://rdrr.io/r/base/paste.html).

## Usage

``` r
p(..., sep = " ", collapse = NULL, recycle0 = FALSE)

p0(..., collapse = NULL, recycle0 = FALSE)
```

## Arguments

- ...:

  one or more R objects, to be converted to character vectors.

- sep:

  a character string to separate the terms. Not
  [`NA_character_`](https://rdrr.io/r/base/NA.html).

- collapse:

  an optional character string to separate the results. Not
  [`NA_character_`](https://rdrr.io/r/base/NA.html). When `collapse` is
  a string, the result is always a string
  ([`character`](https://rdrr.io/r/base/character.html) of length 1).

- recycle0:

  [`logical`](https://rdrr.io/r/base/logical.html) indicating if
  zero-length character arguments should result in the zero-length
  [`character`](https://rdrr.io/r/base/character.html)`(0)`. Note that
  when `collapse` is a string, `recycle0` does *not* recycle to
  zero-length, but to `""`.

## Value

A character vector.

## Functions

- `p0()`: A wrapper on
  [`base::paste0()`](https://rdrr.io/r/base/paste.html)

## Examples

``` r
p("a", "b")
#> [1] "a b"
p(c("a", "b"), collapse = " ")
#> [1] "a b"
p("a", character(0))
#> [1] "a "
p("a", character(0), recycle0 = TRUE)
#> character(0)
p0("a", "b")
#> [1] "ab"
p0(c("a", "b"), collapse = "")
#> [1] "ab"
p0("a", character(0))
#> [1] "a"
p0("a", character(0), recycle0 = TRUE)
#> character(0)
```
