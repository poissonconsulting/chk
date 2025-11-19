pkgname <- "chk"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('chk')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("aaa")
### * aaa

flush(stderr()); flush(stdout())

### Name: aaa
### Title: Workaround: Avoid backtraces in examples
### Aliases: aaa
### Keywords: internal

### ** Examples

options(rlang_backtrace_on_error = "none")



cleanEx()
nameEx("abort_chk")
### * abort_chk

flush(stderr()); flush(stdout())

### Name: abort_chk
### Title: Abort Check
### Aliases: abort_chk

### ** Examples

try(abort_chk("x must be NULL"))
try(abort_chk("`x` must be NULL"))
try(abort_chk("there %r %n problem value%s", n = 1))
try(abort_chk("there %r %n problem value%s", n = 1.5))



cleanEx()
nameEx("cc")
### * cc

flush(stderr()); flush(stdout())

### Name: cc
### Title: Concatenate with Commas
### Aliases: cc

### ** Examples

cc(1:2)
cc(1:2, conj = " or")
cc(3:1, brac = "'")
cc(1:11)
cc(as.character(1:2))



cleanEx()
nameEx("check_data")
### * check_data

flush(stderr()); flush(stdout())

### Name: check_data
### Title: Check Data
### Aliases: check_data

### ** Examples

check_data(data.frame())
check_data(data.frame(x = 2), list(x = 1))
try(check_data(data.frame(x = 2), list(y = 1L)))
try(check_data(data.frame(x = 2), list(y = 1)))
try(check_data(data.frame(x = 2), nrow = 2))



cleanEx()
nameEx("check_dim")
### * check_dim

flush(stderr()); flush(stdout())

### Name: check_dim
### Title: Check Dimension
### Aliases: check_dim

### ** Examples

check_dim(1)
try(check_dim(1, values = FALSE))
try(check_dim(1, values = c(10, 2)))
try(check_dim(data.frame(x = 1), dim = nrow, values = c(10, 10, 2)))



cleanEx()
nameEx("check_dirs")
### * check_dirs

flush(stderr()); flush(stdout())

### Name: check_dirs
### Title: Check Directories Exist
### Aliases: check_dirs

### ** Examples

check_dirs(tempdir())
try(check_dirs(tempdir(), exists = FALSE))



cleanEx()
nameEx("check_files")
### * check_files

flush(stderr()); flush(stdout())

### Name: check_files
### Title: Check Files Exist
### Aliases: check_files

### ** Examples

check_files(tempfile("unlikely-that-exists-chk"), exists = FALSE)
try(check_files(tempfile("unlikely-that-exists-chk")))



cleanEx()
nameEx("check_key")
### * check_key

flush(stderr()); flush(stdout())

### Name: check_key
### Title: Check Key
### Aliases: check_key

### ** Examples

x <- data.frame(x = c(1, 2), y = c(1, 1))
check_key(x)
try(check_key(x, "y"))



cleanEx()
nameEx("check_length")
### * check_length

flush(stderr()); flush(stdout())

### Name: check_length
### Title: Check Length
### Aliases: check_length

### ** Examples

check_length(1)
try(check_length(1, values = FALSE))
try(check_length(1, values = c(10, 2)))



cleanEx()
nameEx("check_names")
### * check_names

flush(stderr()); flush(stdout())

### Name: check_names
### Title: Check Names
### Aliases: check_names

### ** Examples

x <- c(x = 1, y = 2)
check_names(x, c("y", "x"))
try(check_names(x, c("y", "x"), order = TRUE))
try(check_names(x, "x", exclusive = TRUE))



cleanEx()
nameEx("check_values")
### * check_values

flush(stderr()); flush(stdout())

### Name: check_values
### Title: Check Values and Class
### Aliases: check_values

### ** Examples

check_values(1, numeric(0))
check_values(1, 2)
try(check_values(1, 1L))
try(check_values(NA_real_, 1))



cleanEx()
nameEx("chk_all")
### * chk_all

flush(stderr()); flush(stdout())

### Name: chk_all
### Title: Check All
### Aliases: chk_all vld_all

### ** Examples

# chk_all
chk_all(TRUE, chk_lgl)
# FIXME try(chk_all(1, chk_lgl))
chk_all(c(TRUE, NA), chk_lgl)
# vld_all
vld_all(c(TRUE, NA), vld_lgl)



cleanEx()
nameEx("chk_all_equal")
### * chk_all_equal

flush(stderr()); flush(stdout())

### Name: chk_all_equal
### Title: Check All Equal
### Aliases: chk_all_equal vld_all_equal

### ** Examples

# chk_all_equal
chk_all_equal(c(1, 1.00000001))
try(chk_all_equal(c(1, 1.0000001)))
chk_all_equal(list(c(x = 1), c(x = 1)))
try(chk_all_equal(list(c(x = 1), c(y = 1))))
# vld_all_equal
vld_all_equal(c(1, 1L))



cleanEx()
nameEx("chk_all_equivalent")
### * chk_all_equivalent

flush(stderr()); flush(stdout())

### Name: chk_all_equivalent
### Title: Check All Equivalent
### Aliases: chk_all_equivalent vld_all_equivalent

### ** Examples

# chk_all_equivalent
chk_all_equivalent(c(1, 1.00000001))
try(chk_all_equivalent(c(1, 1.0000001)))
chk_all_equivalent(list(c(x = 1), c(x = 1)))
chk_all_equivalent(list(c(x = 1), c(y = 1)))
# vld_all_equivalent
vld_all_equivalent(c(x = 1, y = 1))



cleanEx()
nameEx("chk_all_identical")
### * chk_all_identical

flush(stderr()); flush(stdout())

### Name: chk_all_identical
### Title: Check All Identical
### Aliases: chk_all_identical vld_all_identical

### ** Examples

# chk_all_identical
chk_all_identical(c(1, 1))
try(chk_all_identical(c(1, 1.1)))
# vld_all_identical
vld_all_identical(c(1, 1))



cleanEx()
nameEx("chk_array")
### * chk_array

flush(stderr()); flush(stdout())

### Name: chk_array
### Title: Check Array
### Aliases: chk_array vld_array

### ** Examples

# chk_array
chk_array(array(1))
try(chk_array(matrix(1)))

# vld_array
vld_array(1)
vld_array(array(1))



cleanEx()
nameEx("chk_atomic")
### * chk_atomic

flush(stderr()); flush(stdout())

### Name: chk_atomic
### Title: Check Atomic
### Aliases: chk_atomic vld_atomic

### ** Examples

# chk_atomic
chk_atomic(1)
try(chk_atomic(list(1)))
# vld_atomic
vld_atomic(1)
vld_atomic(matrix(1:3))
vld_atomic(character(0))
vld_atomic(list(1))
vld_atomic(NULL)



cleanEx()
nameEx("chk_character")
### * chk_character

flush(stderr()); flush(stdout())

### Name: chk_character
### Title: Check Character
### Aliases: chk_character vld_character

### ** Examples

# chk_character
chk_character("1")
try(chk_character(1))
# vld_character
vld_character("1")
vld_character(matrix("a"))
vld_character(character(0))
vld_character(NA_character_)
vld_character(1)
vld_character(TRUE)
vld_character(factor("text"))



cleanEx()
nameEx("chk_character_or_factor")
### * chk_character_or_factor

flush(stderr()); flush(stdout())

### Name: chk_character_or_factor
### Title: Check Character or Factor
### Aliases: chk_character_or_factor vld_character_or_factor

### ** Examples

# chk_character_or_factor
chk_character_or_factor("1")
chk_character_or_factor(factor("1"))
try(chk_character(1))
# vld_character_or_factor
vld_character_or_factor("1")
vld_character_or_factor(matrix("a"))
vld_character_or_factor(character(0))
vld_character_or_factor(NA_character_)
vld_character_or_factor(1)
vld_character_or_factor(TRUE)
vld_character_or_factor(factor("text"))



cleanEx()
nameEx("chk_chr")
### * chk_chr

flush(stderr()); flush(stdout())

### Name: chk_chr
### Title: Check Character Scalar
### Aliases: chk_chr vld_chr

### ** Examples

chk_chr("a")
try(chk_chr(1))
# vld_chr
vld_chr("")
vld_chr("a")
vld_chr(NA_character_)
vld_chr(c("a", "b"))
vld_chr(1)



cleanEx()
nameEx("chk_compatible_lengths")
### * chk_compatible_lengths

flush(stderr()); flush(stdout())

### Name: chk_compatible_lengths
### Title: Check Compatible Lengths
### Aliases: chk_compatible_lengths vld_compatible_lengths

### ** Examples

# chk_compatible_lengths

a <- integer(0)
b <- numeric(0)
chk_compatible_lengths(a, b)

a <- 1
b <- 2
chk_compatible_lengths(a, b)

a <- 1:3
b <- 1:3
chk_compatible_lengths(a, b)

b <- 1
chk_compatible_lengths(a, b)

b <- 1:2
try(chk_compatible_lengths(a, b))

b <- 1:6
try(chk_compatible_lengths(a, b))
# vld_compatible_lengths

a <- integer(0)
b <- numeric(0)
vld_compatible_lengths(a, b)

a <- 1
b <- 2
vld_compatible_lengths(a, b)

a <- 1:3
b <- 1:3
vld_compatible_lengths(a, b)

b <- 1
vld_compatible_lengths(a, b)

b <- 1:2
vld_compatible_lengths(a, b)

b <- 1:6
vld_compatible_lengths(a, b)



cleanEx()
nameEx("chk_complex")
### * chk_complex

flush(stderr()); flush(stdout())

### Name: chk_complex
### Title: Check Complex
### Aliases: chk_complex vld_complex

### ** Examples

# chk_complex
chk_complex(1i)
try(chk_complex(1))
# vld_complex
vld_complex(1i)
vld_complex(complex())
vld_complex(NA_complex_)
vld_complex(1)
vld_complex(TRUE)



cleanEx()
nameEx("chk_complex_number")
### * chk_complex_number

flush(stderr()); flush(stdout())

### Name: chk_complex_number
### Title: Check Complex Number
### Aliases: chk_complex_number vld_complex_number

### ** Examples

# chk_complex_number
chk_complex_number(as.complex(1.1))
try(chk_complex_number(1.1))
# vld_complex_number
vld_complex_number(as.complex(2))



cleanEx()
nameEx("chk_count")
### * chk_count

flush(stderr()); flush(stdout())

### Name: chk_count
### Title: Check Count
### Aliases: chk_count vld_count

### ** Examples

# chk_count
chk_count(1)
try(chk_count(1.5))
# vld_count
vld_count(1)
vld_count(0L)
vld_count(-1)
vld_count(0.5)



cleanEx()
nameEx("chk_data")
### * chk_data

flush(stderr()); flush(stdout())

### Name: chk_data
### Title: Check Data
### Aliases: chk_data vld_data

### ** Examples

# chk_data
chk_data(data.frame(x = 1))
try(chk_data(1))
# vld_data
vld_data(data.frame())
vld_data(data.frame(x = 1))
vld_data(c(x = 1))



cleanEx()
nameEx("chk_date")
### * chk_date

flush(stderr()); flush(stdout())

### Name: chk_date
### Title: Check Date
### Aliases: chk_date vld_date

### ** Examples

# chk_date
chk_date(Sys.Date())
try(chk_date(1))
# vld_date
vld_date(Sys.Date())
vld_date(Sys.time())
vld_date(1)



cleanEx()
nameEx("chk_date_time")
### * chk_date_time

flush(stderr()); flush(stdout())

### Name: chk_date_time
### Title: Check Date Time
### Aliases: chk_date_time chk_datetime vld_date_time vld_datetime

### ** Examples

# chk_date_time
chk_date_time(as.POSIXct("2001-01-02"))
try(chk_date_time(1))
# vld_date_time
vld_date_time(as.POSIXct("2001-01-02"))
vld_date_time(Sys.time())
vld_date_time(1)
vld_date_time("2001-01-02")
vld_date_time(c(Sys.time(), Sys.time()))



cleanEx()
nameEx("chk_dbl")
### * chk_dbl

flush(stderr()); flush(stdout())

### Name: chk_dbl
### Title: Check Double Scalar
### Aliases: chk_dbl vld_dbl

### ** Examples

# chk_dbl
chk_dbl(1)
try(chk_dbl(1L))
# vld_dbl
vld_dbl(1)
vld_dbl(double(0))
vld_dbl(NA_real_)
vld_dbl(c(1, 1))
vld_dbl(1L)



cleanEx()
nameEx("chk_dir")
### * chk_dir

flush(stderr()); flush(stdout())

### Name: chk_dir
### Title: Check Directory Exists
### Aliases: chk_dir vld_dir

### ** Examples

# chk_dir
chk_dir(tempdir())
try(chk_dir(tempfile()))
# vld_dir
vld_dir(1)
vld_dir(tempdir())
vld_dir(tempfile())



cleanEx()
nameEx("chk_double")
### * chk_double

flush(stderr()); flush(stdout())

### Name: chk_double
### Title: Check Double
### Aliases: chk_double vld_double

### ** Examples

# chk_double
chk_double(1)
try(chk_double(1L))
# vld_double
vld_double(1)
vld_double(matrix(c(1, 2, 3, 4), nrow = 2L))
vld_double(double(0))
vld_double(numeric(0))
vld_double(NA_real_)
vld_double(1L)
vld_double(TRUE)



cleanEx()
nameEx("chk_environment")
### * chk_environment

flush(stderr()); flush(stdout())

### Name: chk_environment
### Title: Check Environment
### Aliases: chk_environment vld_environment

### ** Examples

# chk_environment
chk_environment(.GlobalEnv)
try(chk_environment(1))
# vld_environment
vld_environment(1)
vld_environment(list(1))
vld_environment(.GlobalEnv)
vld_environment(environment())



cleanEx()
nameEx("chk_equal")
### * chk_equal

flush(stderr()); flush(stdout())

### Name: chk_equal
### Title: Check Equal
### Aliases: chk_equal vld_equal

### ** Examples

# chk_equal
chk_equal(1, 1.00000001)
try(chk_equal(1, 1.0000001))
chk_equal(1, 1L)
chk_equal(c(x = 1), c(x = 1L))
try(chk_equal(c(x = 1), c(y = 1L)))
vld_equal(1, 1.00000001)



cleanEx()
nameEx("chk_equivalent")
### * chk_equivalent

flush(stderr()); flush(stdout())

### Name: chk_equivalent
### Title: Check Equivalent
### Aliases: chk_equivalent vld_equivalent

### ** Examples

# chk_equivalent
chk_equivalent(1, 1.00000001)
try(chk_equivalent(1, 1.0000001))
chk_equivalent(1, 1L)
chk_equivalent(c(x = 1), c(y = 1))
vld_equivalent(c(x = 1), c(y = 1L))



cleanEx()
nameEx("chk_ext")
### * chk_ext

flush(stderr()); flush(stdout())

### Name: chk_ext
### Title: Check File Extension
### Aliases: chk_ext vld_ext

### ** Examples

# chk_ext
try(chk_ext("file1.pdf", "png"))
# vld_ext
vld_ext("oeu.pdf", "pdf")
vld_ext(toupper("oeu.pdf"), "PDF")



cleanEx()
nameEx("chk_factor")
### * chk_factor

flush(stderr()); flush(stdout())

### Name: chk_factor
### Title: Check Factor
### Aliases: chk_factor vld_factor

### ** Examples

# chk_factor
chk_factor(factor("1"))
try(chk_factor("1"))
# vld_factor
vld_factor(factor("1"))
vld_factor(factor(0))
vld_factor("1")
vld_factor(1L)



cleanEx()
nameEx("chk_false")
### * chk_false

flush(stderr()); flush(stdout())

### Name: chk_false
### Title: Check FALSE
### Aliases: chk_false vld_false

### ** Examples

# chk_false
chk_false(FALSE)
try(chk_false(0))
# vld_false
vld_false(TRUE)
vld_false(FALSE)
vld_false(NA)
vld_false(0)
vld_false(c(FALSE, FALSE))



cleanEx()
nameEx("chk_file")
### * chk_file

flush(stderr()); flush(stdout())

### Name: chk_file
### Title: Check File Exists
### Aliases: chk_file vld_file

### ** Examples

# chk_file
try(chk_file(tempfile()))
# vld_file
vld_file(tempfile())



cleanEx()
nameEx("chk_flag")
### * chk_flag

flush(stderr()); flush(stdout())

### Name: chk_flag
### Title: Check Flag
### Aliases: chk_flag vld_flag

### ** Examples

# chk_flag
chk_flag(TRUE)
try(vld_flag(1))
# vld_flag
vld_flag(TRUE)
vld_flag(1)



cleanEx()
nameEx("chk_function")
### * chk_function

flush(stderr()); flush(stdout())

### Name: chk_function
### Title: Check Function
### Aliases: chk_function vld_function

### ** Examples

# chk_function
chk_function(mean)
try(chk_function(1))
# vld_function
vld_function(mean)
vld_function(function(x) x)
vld_function(1)
vld_function(list(1))



cleanEx()
nameEx("chk_gt")
### * chk_gt

flush(stderr()); flush(stdout())

### Name: chk_gt
### Title: Check Greater Than
### Aliases: chk_gt vld_gt

### ** Examples

# chk_gt
chk_gt(0.1)
try(chk_gt(c(0.1, -0.2)))
# vld_gt
vld_gt(numeric(0))
vld_gt(0)
vld_gt(0.1)
vld_gt(c(0.1, 0.2, NA))
vld_gt(c(0.1, -0.2))
vld_gt(c(-0.1, 0.2), value = -1)
vld_gt("b", value = "a")



cleanEx()
nameEx("chk_gte")
### * chk_gte

flush(stderr()); flush(stdout())

### Name: chk_gte
### Title: Check Greater Than or Equal To
### Aliases: chk_gte vld_gte

### ** Examples

# chk_gte
chk_gte(0)
try(chk_gte(-0.1))
# vld_gte
vld_gte(numeric(0))
vld_gte(0)
vld_gte(-0.1)
vld_gte(c(0.1, 0.2, NA))
vld_gte(c(0.1, 0.2, NA), value = 1)



cleanEx()
nameEx("chk_identical")
### * chk_identical

flush(stderr()); flush(stdout())

### Name: chk_identical
### Title: Check Identical
### Aliases: chk_identical vld_identical

### ** Examples

# chk_identical
chk_identical(1, 1)
try(chk_identical(1, 1L))
chk_identical(c(1, 1), c(1, 1))
try(chk_identical(1, c(1, 1)))
vld_identical(1, 1)



cleanEx()
nameEx("chk_integer")
### * chk_integer

flush(stderr()); flush(stdout())

### Name: chk_integer
### Title: Check Integer
### Aliases: chk_integer vld_integer

### ** Examples

# chk_integer
chk_integer(1L)
try(chk_integer(1))
# vld_integer
vld_integer(1L)
vld_integer(matrix(1:4, nrow = 2L))
vld_integer(integer(0))
vld_integer(NA_integer_)
vld_integer(1)
vld_integer(TRUE)



cleanEx()
nameEx("chk_is")
### * chk_is

flush(stderr()); flush(stdout())

### Name: chk_is
### Title: Check Class
### Aliases: chk_is vld_is

### ** Examples

chk_is(1, "numeric")
try(chk_is(1L, "double"))

# vld_is
vld_is(numeric(0), "numeric")
vld_is(1L, "double")



cleanEx()
nameEx("chk_join")
### * chk_join

flush(stderr()); flush(stdout())

### Name: chk_join
### Title: Check Join
### Aliases: chk_join vld_join

### ** Examples

# chk_join
chk_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
try(chk_join(data.frame(z = 1), data.frame(z = 2), by = "z"))
# vld_join
vld_join(data.frame(z = 1), data.frame(z = 1:2), by = "z")
vld_join(data.frame(z = 1), data.frame(z = 2), by = "z")
vld_join(data.frame(z = 1), data.frame(a = 1:2), by = c(z = "a"))
vld_join(data.frame(z = 1), data.frame(a = 2), by = c(z = "a"))



cleanEx()
nameEx("chk_length")
### * chk_length

flush(stderr()); flush(stdout())

### Name: chk_length
### Title: Check Length
### Aliases: chk_length vld_length

### ** Examples

# chk_length
chk_length("text")
try(vld_length("text", length = 2))
# vld_length
vld_length(2:1, 2)
vld_length(2:1, 1)



cleanEx()
nameEx("chk_lgl")
### * chk_lgl

flush(stderr()); flush(stdout())

### Name: chk_lgl
### Title: Check Logical Scalar
### Aliases: chk_lgl vld_lgl

### ** Examples

# chk_lgl
chk_lgl(NA)
try(chk_lgl(1))
# vld_lgl
vld_lgl(TRUE)
vld_lgl(FALSE)
vld_lgl(NA)
vld_lgl(1)
vld_lgl(c(TRUE, TRUE))



cleanEx()
nameEx("chk_list")
### * chk_list

flush(stderr()); flush(stdout())

### Name: chk_list
### Title: Check List
### Aliases: chk_list vld_list

### ** Examples

# chk_list
chk_list(list())
try(chk_list(1))
# vld_list
vld_list(list())
vld_list(list(x = 1))
vld_list(mtcars)
vld_list(1)
vld_list(NULL)



cleanEx()
nameEx("chk_logical")
### * chk_logical

flush(stderr()); flush(stdout())

### Name: chk_logical
### Title: Check Logical
### Aliases: chk_logical vld_logical

### ** Examples

# chk_logical
chk_logical(TRUE)
try(chk_logical(1))
# vld_logical
vld_logical(TRUE)
vld_logical(matrix(TRUE))
vld_logical(logical(0))
vld_logical(NA)
vld_logical(1)
vld_logical("TRUE")



cleanEx()
nameEx("chk_lt")
### * chk_lt

flush(stderr()); flush(stdout())

### Name: chk_lt
### Title: Check Less Than
### Aliases: chk_lt vld_lt

### ** Examples

# chk_lt
chk_lt(-0.1)
try(chk_lt(c(-0.1, 0.2)))
# vld_lt
vld_lt(numeric(0))
vld_lt(0)
vld_lt(-0.1)
vld_lt(c(-0.1, -0.2, NA))
vld_lt(c(-0.1, 0.2))
vld_lt(c(-0.1, 0.2), value = 1)
vld_lt("a", value = "b")



cleanEx()
nameEx("chk_lte")
### * chk_lte

flush(stderr()); flush(stdout())

### Name: chk_lte
### Title: Check Less Than or Equal To
### Aliases: chk_lte vld_lte

### ** Examples

# chk_lte
chk_lte(0)
try(chk_lte(0.1))
# vld_lte
vld_lte(numeric(0))
vld_lte(0)
vld_lte(0.1)
vld_lte(c(-0.1, -0.2, NA))
vld_lte(c(-0.1, -0.2, NA), value = -1)



cleanEx()
nameEx("chk_match")
### * chk_match

flush(stderr()); flush(stdout())

### Name: chk_match
### Title: Check Matches
### Aliases: chk_match vld_match

### ** Examples

# chk_match
chk_match("1")
try(chk_match("1", regexp = "2"))
# vld_match
vld_match("1")
vld_match("a", regexp = "a")
vld_match("")
vld_match("1", regexp = "2")
vld_match(NA_character_, regexp = ".*")



cleanEx()
nameEx("chk_matrix")
### * chk_matrix

flush(stderr()); flush(stdout())

### Name: chk_matrix
### Title: Check Matrix
### Aliases: chk_matrix vld_matrix

### ** Examples

# chk_matrix
chk_matrix(matrix(1))
try(chk_matrix(array(1)))
# vld_matrix
vld_matrix(1)
vld_matrix(matrix(1))



cleanEx()
nameEx("chk_missing")
### * chk_missing

flush(stderr()); flush(stdout())

### Name: chk_missing
### Title: Check Missing Argument
### Aliases: chk_missing vld_missing

### ** Examples

# chk_missing
fun <- function(x) {
  chk_missing(x)
}
fun()
try(fun(1))
# vld_missing
fun <- function(x) {
  vld_missing(x)
}
fun()
fun(1)



cleanEx()
nameEx("chk_named")
### * chk_named

flush(stderr()); flush(stdout())

### Name: chk_named
### Title: Check Named
### Aliases: chk_named vld_named

### ** Examples

# chk_named
chk_named(c(x = 1))
try(chk_named(list(1)))
# vld_named
vld_named(c(x = 1))
vld_named(list(x = 1))
vld_named(c(x = 1)[-1])
vld_named(list(x = 1)[-1])
vld_named(1)
vld_named(list(1))



cleanEx()
nameEx("chk_not_any_na")
### * chk_not_any_na

flush(stderr()); flush(stdout())

### Name: chk_not_any_na
### Title: Check Not Any Missing Values
### Aliases: chk_not_any_na vld_not_any_na

### ** Examples

# chk_not_any_na
chk_not_any_na(1)
try(chk_not_any_na(NA))
# vld_not_any_na
vld_not_any_na(1)
vld_not_any_na(1:2)
vld_not_any_na(NA_real_)
vld_not_any_na(integer(0))
vld_not_any_na(c(NA, 1))
vld_not_any_na(TRUE)



cleanEx()
nameEx("chk_not_empty")
### * chk_not_empty

flush(stderr()); flush(stdout())

### Name: chk_not_empty
### Title: Check Not Empty
### Aliases: chk_not_empty vld_not_empty

### ** Examples

# chk_not_empty
chk_not_empty(1)
try(chk_not_empty(numeric(0)))
# vld_not_empty
vld_not_empty(1)
vld_not_empty(matrix(1:3))
vld_not_empty(character(0))
vld_not_empty(list(1))
vld_not_empty(NULL)
vld_not_empty(list())



cleanEx()
nameEx("chk_not_missing")
### * chk_not_missing

flush(stderr()); flush(stdout())

### Name: chk_not_missing
### Title: Check Not Missing Argument
### Aliases: chk_not_missing vld_not_missing

### ** Examples

# chk_not_missing
fun <- function(x) {
  chk_not_missing(x)
}
fun(1)
try(fun())
# vld_not_missing
fun <- function(x) {
  vld_not_missing(x)
}
fun()
fun(1)



cleanEx()
nameEx("chk_not_null")
### * chk_not_null

flush(stderr()); flush(stdout())

### Name: chk_not_null
### Title: Check not NULL
### Aliases: chk_not_null vld_not_null

### ** Examples

# chk_not_null
try(chk_not_null(NULL))
chk_not_null(1)
# vld_not_null
vld_not_null(1)
vld_not_null(NULL)



cleanEx()
nameEx("chk_not_subset")
### * chk_not_subset

flush(stderr()); flush(stdout())

### Name: chk_not_subset
### Title: Check Not Subset
### Aliases: chk_not_subset

### ** Examples

# chk_not_subset
chk_not_subset(11, 1:10)
try(chk_not_subset(1, 1:10))



cleanEx()
nameEx("chk_null")
### * chk_null

flush(stderr()); flush(stdout())

### Name: chk_null
### Title: Check NULL
### Aliases: chk_null vld_null

### ** Examples

# chk_null
try(chk_null(1))
chk_null(NULL)
# vld_null
vld_null(NULL)
vld_null(1)



cleanEx()
nameEx("chk_null_or")
### * chk_null_or

flush(stderr()); flush(stdout())

### Name: chk_null_or
### Title: Check NULL Or
### Aliases: chk_null_or

### ** Examples

chk_null_or(NULL, chk_number)
chk_null_or(1, chk_number)
try(chk_null_or("1", chk_number))



cleanEx()
nameEx("chk_number")
### * chk_number

flush(stderr()); flush(stdout())

### Name: chk_number
### Title: Check Number
### Aliases: chk_number vld_number

### ** Examples

# chk_number
chk_number(1.1)
try(chk_number(TRUE))
# vld_number
vld_number(1.1)



cleanEx()
nameEx("chk_numeric")
### * chk_numeric

flush(stderr()); flush(stdout())

### Name: chk_numeric
### Title: Check Numeric
### Aliases: chk_numeric vld_numeric

### ** Examples

# chk_numeric
chk_numeric(1)
try(chk_numeric("1"))
# vld_numeric
vld_numeric(1)
vld_numeric(1:2)
vld_numeric(NA_real_)
vld_numeric(integer(0))
vld_numeric("1")
vld_numeric(TRUE)



cleanEx()
nameEx("chk_orderset")
### * chk_orderset

flush(stderr()); flush(stdout())

### Name: chk_orderset
### Title: Check Set Ordered
### Aliases: chk_orderset

### ** Examples


# chk_orderset
chk_orderset(1:2, 1:2)
try(chk_orderset(2:1, 1:2))



cleanEx()
nameEx("chk_range")
### * chk_range

flush(stderr()); flush(stdout())

### Name: chk_range
### Title: Checks range of non-missing values
### Aliases: chk_range vld_range

### ** Examples

# chk_range
chk_range(0)
try(chk_range(-0.1))
# vld_range
vld_range(numeric(0))
vld_range(0)
vld_range(-0.1)
vld_range(c(0.1, 0.2, NA))
vld_range(c(0.1, 0.2, NA), range = c(0, 1))



cleanEx()
nameEx("chk_raw")
### * chk_raw

flush(stderr()); flush(stdout())

### Name: chk_raw
### Title: Check Raw
### Aliases: chk_raw vld_raw

### ** Examples

# chk_raw
chk_raw(as.raw(1))
try(chk_raw(1))
# vld_raw
vld_raw(as.raw(1))
vld_raw(raw(0))
vld_raw(1)
vld_raw(TRUE)



cleanEx()
nameEx("chk_s3_class")
### * chk_s3_class

flush(stderr()); flush(stdout())

### Name: chk_s3_class
### Title: Check Type
### Aliases: chk_s3_class vld_s3_class

### ** Examples

# chk_s3_class
chk_s3_class(1, "numeric")
try(chk_s3_class(getClass("MethodDefinition"), "classRepresentation"))
# vld_s3_class
vld_s3_class(numeric(0), "numeric")
vld_s3_class(getClass("MethodDefinition"), "classRepresentation")



cleanEx()
nameEx("chk_s4_class")
### * chk_s4_class

flush(stderr()); flush(stdout())

### Name: chk_s4_class
### Title: Check Inherits from S4 Class
### Aliases: chk_s4_class vld_s4_class

### ** Examples

# chk_s4_class
try(chk_s4_class(1, "numeric"))
chk_s4_class(getClass("MethodDefinition"), "classRepresentation")
# vld_s4_class
vld_s4_class(numeric(0), "numeric")
vld_s4_class(getClass("MethodDefinition"), "classRepresentation")



cleanEx()
nameEx("chk_scalar")
### * chk_scalar

flush(stderr()); flush(stdout())

### Name: chk_scalar
### Title: Check Scalar
### Aliases: chk_scalar vld_scalar

### ** Examples

# chk_scalar
chk_scalar(1)
chk_scalar(list(1))
try(chk_scalar(1:2))
# vld_scalar
vld_scalar(1)



cleanEx()
nameEx("chk_setequal")
### * chk_setequal

flush(stderr()); flush(stdout())

### Name: vld_orderset
### Title: Check Set Equal
### Aliases: vld_orderset chk_setequal vld_setequal

### ** Examples


# vld_orderset
vld_orderset(1, 1)
vld_orderset(1:2, 2:1)
vld_orderset(1, 2:1)
vld_orderset(1:2, 2)
# chk_setequal
chk_setequal(1:2, 2:1)
try(chk_setequal(1, 1:2))
# vld_setequal
vld_setequal(1, 1)
vld_setequal(1:2, 2:1)
vld_setequal(1, 2:1)
vld_setequal(1:2, 2)



cleanEx()
nameEx("chk_sorted")
### * chk_sorted

flush(stderr()); flush(stdout())

### Name: chk_sorted
### Title: Check Sorted
### Aliases: chk_sorted vld_sorted

### ** Examples

# chk_sorted
chk_sorted(1:2)
try(chk_sorted(2:1))
# vld_sorted
vld_sorted(1:2)
vld_sorted(2:1)



cleanEx()
nameEx("chk_string")
### * chk_string

flush(stderr()); flush(stdout())

### Name: chk_string
### Title: Check String
### Aliases: chk_string vld_string

### ** Examples

# chk_string
chk_string("1")
try(chk_string(1))
# vld_string
vld_string("1")
vld_string("")
vld_string(1)
vld_string(NA_character_)
vld_string(c("1", "1"))



cleanEx()
nameEx("chk_subset")
### * chk_subset

flush(stderr()); flush(stdout())

### Name: vld_not_subset
### Title: Check Subset
### Aliases: vld_not_subset chk_subset vld_subset

### ** Examples

# vld_not_subset
vld_not_subset(numeric(0), 1:10)
vld_not_subset(1, 1:10)
vld_not_subset(11, 1:10)
# chk_subset
chk_subset(1, 1:10)
try(chk_subset(11, 1:10))
# vld_subset
vld_subset(numeric(0), 1:10)
vld_subset(1, 1:10)
vld_subset(11, 1:10)



cleanEx()
nameEx("chk_superset")
### * chk_superset

flush(stderr()); flush(stdout())

### Name: chk_superset
### Title: Check Superset
### Aliases: chk_superset vld_superset

### ** Examples

# chk_superset
chk_superset(1:3, 1)
try(chk_superset(1:3, 4))
# vld_superset
vld_superset(1:3, 1)
vld_superset(1:3, 4)
vld_superset(integer(0), integer(0))



cleanEx()
nameEx("chk_true")
### * chk_true

flush(stderr()); flush(stdout())

### Name: chk_true
### Title: Check TRUE
### Aliases: chk_true vld_true

### ** Examples

# chk_true
chk_true(TRUE)
try(chk_true(1))
# vld_true
vld_true(TRUE)
vld_true(FALSE)
vld_true(NA)
vld_true(0)
vld_true(c(TRUE, TRUE))



cleanEx()
nameEx("chk_tz")
### * chk_tz

flush(stderr()); flush(stdout())

### Name: chk_tz
### Title: Check Time Zone
### Aliases: chk_tz vld_tz

### ** Examples

chk_tz("UTC")
try(chk_tz("TCU"))
vld_tz("UTC")
vld_tz("TCU")



cleanEx()
nameEx("chk_unique")
### * chk_unique

flush(stderr()); flush(stdout())

### Name: chk_unique
### Title: Check Unique
### Aliases: chk_unique vld_unique

### ** Examples

# chk_unique
chk_unique(c(NA, 2))
try(chk_unique(c(NA, NA, 2)))
chk_unique(c(NA, NA, 2), incomparables = NA)
# vld_unique
vld_unique(NULL)
vld_unique(numeric(0))
vld_unique(c(NA, 2))
vld_unique(c(NA, NA, 2))
vld_unique(c(NA, NA, 2), incomparables = NA)



cleanEx()
nameEx("chk_unused")
### * chk_unused

flush(stderr()); flush(stdout())

### Name: chk_unused
### Title: Check ... Unused
### Aliases: chk_unused vld_unused

### ** Examples

# chk_unused
fun <- function(x, ...) {
  chk_unused(...)
  x
}
fun(1)
try(fun(1, 2))
# vld_unused
fun <- function(x, ...) {
  vld_unused(...)
}
fun(1)
try(fun(1, 2))



cleanEx()
nameEx("chk_used")
### * chk_used

flush(stderr()); flush(stdout())

### Name: chk_used
### Title: Check ... Used
### Aliases: chk_used vld_used

### ** Examples

# chk_used
fun <- function(x, ...) {
  chk_used(...)
  x
}
try(fun(1))
fun(1, 2)
# vld_used
fun <- function(x, ...) {
  vld_used(...)
}
fun(1)
fun(1, 2)



cleanEx()
nameEx("chk_valid_name")
### * chk_valid_name

flush(stderr()); flush(stdout())

### Name: chk_valid_name
### Title: Check Valid Name
### Aliases: chk_valid_name vld_valid_name

### ** Examples

# chk_valid_name
chk_valid_name("text")
try(chk_valid_name(".1"))
# vld_valid_name
vld_valid_name(".1")



cleanEx()
nameEx("chk_vector")
### * chk_vector

flush(stderr()); flush(stdout())

### Name: chk_vector
### Title: Check Vector
### Aliases: chk_vector vld_vector

### ** Examples

# chk_vector
chk_vector(1)
chk_vector(list())
try(chk_vector(matrix(1)))
# vld_vector
vld_vector(1)



cleanEx()
nameEx("chk_whole_number")
### * chk_whole_number

flush(stderr()); flush(stdout())

### Name: chk_whole_number
### Title: Check Whole Number
### Aliases: chk_whole_number vld_whole_number

### ** Examples

# chk_whole_number
chk_whole_number(2)
try(chk_whole_number(1.1))
# vld_whole_number
vld_whole_number(2)



cleanEx()
nameEx("chk_whole_numeric")
### * chk_whole_numeric

flush(stderr()); flush(stdout())

### Name: chk_whole_numeric
### Title: Check Whole Numeric
### Aliases: chk_whole_numeric vld_whole_numeric

### ** Examples

# chk_whole_numeric
chk_whole_numeric(1)
try(chk_whole_numeric(1.1))
# vld_whole_numeric
vld_whole_numeric(1)
vld_whole_numeric(NA_real_)
vld_whole_numeric(1:2)
vld_whole_numeric(double(0))
vld_whole_numeric(TRUE)
vld_whole_numeric(1.5)



cleanEx()
nameEx("chk_wnum")
### * chk_wnum

flush(stderr()); flush(stdout())

### Name: chk_wnum
### Title: Check Whole Numeric Scalar
### Aliases: chk_wnum vld_wnum

### ** Examples

# chk_wnum
chk_wnum(1)
try(chk_wnum(1.1))
# vld_wnum
vld_wnum(1)
vld_wnum(double(0))
vld_wnum(NA_real_)
vld_wnum(c(1, 1))
vld_wnum(1L)



cleanEx()
nameEx("chkor")
### * chkor

flush(stderr()); flush(stdout())

### Name: chkor
### Title: Check OR
### Aliases: chkor

### ** Examples

chkor()
chkor(chk_flag(TRUE))
try(chkor(chk_flag(1)))
try(chkor(chk_flag(1), chk_flag(2)))
chkor(chk_flag(1), chk_flag(TRUE))



cleanEx()
nameEx("chkor_vld")
### * chkor_vld

flush(stderr()); flush(stdout())

### Name: chkor_vld
### Title: Chk OR
### Aliases: chkor_vld

### ** Examples

chkor_vld()
chkor_vld(vld_flag(TRUE))
try(chkor_vld(vld_flag(1)))
try(chkor_vld(vld_flag(1), vld_flag(2)))
chkor_vld(vld_flag(1), vld_flag(TRUE))



cleanEx()
nameEx("deparse_backtick_chk")
### * deparse_backtick_chk

flush(stderr()); flush(stdout())

### Name: deparse_backtick_chk
### Title: Deparse Backtick
### Aliases: deparse_backtick_chk backtick_chk unbacktick_chk

### ** Examples


# deparse_backtick_chk
deparse_backtick_chk(2)
deparse_backtick_chk(2^2)



cleanEx()
nameEx("err")
### * err

flush(stderr()); flush(stdout())

### Name: err
### Title: Stop, Warning and Message Messages
### Aliases: err wrn msg

### ** Examples


# err
try(err("there %r %n problem value%s", n = 2))

# wrn
wrn("there %r %n problem value%s", n = 2)

# msg
msg("there %r %n problem value%s", n = 2)



cleanEx()
nameEx("expect_chk_error")
### * expect_chk_error

flush(stderr()); flush(stdout())

### Name: expect_chk_error
### Title: Expect Chk Error
### Aliases: expect_chk_error

### ** Examples

expect_chk_error(chk_true(FALSE))
try(expect_chk_error(chk_false(FALSE)))



cleanEx()
nameEx("message_chk")
### * message_chk

flush(stderr()); flush(stdout())

### Name: message_chk
### Title: Construct Tidyverse Style Message
### Aliases: message_chk

### ** Examples

message_chk("there %r %n", " problem director%y%s")
message_chk("there %r %n", " problem director%y%s", n = 1)
message_chk("There %r %n", " problem director%y%s.", n = 3)



cleanEx()
nameEx("p")
### * p

flush(stderr()); flush(stdout())

### Name: p
### Title: Concatenate Strings
### Aliases: p p0

### ** Examples

p("a", "b")
p(c("a", "b"), collapse = " ")
p0("a", "b")
p0(c("a", "b"), collapse = "")



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
