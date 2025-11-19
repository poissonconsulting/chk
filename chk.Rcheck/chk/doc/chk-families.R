## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(chk)

## ----chk_, echo = FALSE, out.width= "100%", fig.align='center', fig.alt = "Classification of the chk functions by family"----
knitr::include_graphics("chk_diagram_II.png")

## -----------------------------------------------------------------------------
vector <- c(1, 2, 3)
is.vector(vector) # TRUE
vld_vector(vector) # TRUE

attributes(vector) <-  list("a" = 10, "b" = 20, "c" = 30)
is.vector(vector) # FALSE
vld_vector(vector) # TRUE

## -----------------------------------------------------------------------------
vector <- c(1, 2, 3)
is.atomic(vector) # TRUE
vld_vector(vector) # TRUE

is.atomic(NULL) # TRUE
vld_vector(NULL) # TRUE

## -----------------------------------------------------------------------------
vld_numeric(33) # TRUE

vld_double(33) # TRUE
vld_integer(33) # FALSE

vld_integer(33L) # TRUE

## -----------------------------------------------------------------------------
# Integer vector
vld_whole_numeric(c(1L, 2L, 3L)) # TRUE

# Double vector representing whole numbers
vld_whole_numeric(c(1.0, 2.0, 3.0)) # TRUE

# Double vector with fractional numbers
vld_whole_numeric(c(1.0, 2.2, 3.0)) # FALSE

## -----------------------------------------------------------------------------
# Integer vector
vld_whole_numeric(c(1L, 2L, 3L)) # TRUE
vld_whole_number(c(1L, 2L, 3L)) # FALSE
vld_whole_number(c(1L)) # TRUE

## -----------------------------------------------------------------------------
# Positive integer
vld_count(1) #TRUE
# Zero
vld_count(0) # TRUE
# Negative number
vld_count(-1) # FALSE
# Non-whole number
vld_count(2.5) # FALSE

## -----------------------------------------------------------------------------
# Factor with specified levels

vector_fruits <- c("apple", "banana", "apple", "orange", "banana", "apple")

factor_fruits <- factor(c("apple", "banana", "apple", "orange", "banana", "apple"),
                levels = c("apple", "banana", "orange"))


is.factor(factor_fruits) # TRUE
vld_factor(factor_fruits) # TRUE

is.character(factor_fruits) # FALSE
vld_character(factor_fruits) # FALSE

vld_character_or_factor(factor_fruits) # TRUE


## -----------------------------------------------------------------------------
vld_all(c(TRUE, TRUE, FALSE), chk_lgl) # FALSE

## -----------------------------------------------------------------------------
vld_function(function(x) x, formals = 1) # TRUE
vld_function(function(x, y) x + y, formals = 1) # FALSE
vld_function(function(x, y) x + y, formals = 2) # TRUE

## -----------------------------------------------------------------------------

vld_valid_name(c("name1", NA, "name_2", "validName"))  # TRUE
vld_valid_name(c(1, 2, 3))  # FALSE


vld_named(data.frame(a = 1:5, b = 6:10))  # TRUE
vld_named(list(a = 1, b = 2)) # TRUE
vld_named(c(a = 1, b = 2)) # TRUE 
vld_named(c(1, 2, 3)) # FALSE 


## -----------------------------------------------------------------------------
vld_all_identical(c(1, 2, 3)) # FALSE
vld_all_identical(c(1, 1, 1)) # TRUE
vld_identical(c(1, 2, 3), c(1, 2, 3)) # TRUE

vld_all_equal(c(0.1, 0.12, 0.13))
vld_all_equal(c(0.1, 0.12, 0.13), tolerance = 0.2)
vld_equal(c(0.1, 0.12, 0.13), c(0.1, 0.12, 0.13)) # TRUE
vld_equal(c(0.1, 0.12, 0.13), c(0.1, 0.12, 0.4), tolerance = 0.5) # TRUE

x <- c(0.1, 0.1, 0.1)
y <- c(0.1, 0.12, 0.13)
attr(y, "label") <- "Numbers"
vld_equal(x, y, tolerance = 0.5) # FALSE
vld_equivalent(x, y, tolerance = 0.5) # TRUE

## -----------------------------------------------------------------------------
# Checking if sorted
vld_sorted(c(1, 2, 3, NA, 4))  # TRUE
vld_sorted(c(3, 1, 2, NA, 4))  # FALSE

## -----------------------------------------------------------------------------
vld_setequal(c(1, 2, 3), c(3, 2, 1)) # TRUE
vld_setequal(c(1, 2, 3), c(3, 2, 1, 4)) # FALSE
vld_setequal(c(1, 2, 3, 4), c(3, 2, 1)) # FALSE
vld_setequal(c(1, 2), c(1, 1, 1, 1, 1, 1, 2, 1)) # TRUE

## -----------------------------------------------------------------------------

# When both function inputs have the same elements,
# all functions return TRUE

vld_setequal(c(1, 2, 3), c(3, 2, 1)) # TRUE
vld_subset(c(1, 2, 3), c(3, 2, 1)) # TRUE
vld_superset(c(1, 2, 3), c(3, 2, 1)) # TRUE

vld_setequal(c(1, 2), c(1, 1, 1, 1, 1, 1, 2, 1)) # TRUE
vld_subset(c(1, 2), c(1, 1, 1, 1, 1, 1, 2, 1)) # TRUE
vld_superset(c(1, 2), c(1, 1, 1, 1, 1, 1, 2, 1)) # TRUE

# When there are elements present in one vector but not the other,
# `vld_setequal()` will return FALSE

vld_setequal(c(1, 2, 3), c(3, 2, 1, 4)) # FALSE
vld_setequal(c(1, 2, 3, 4), c(3, 2, 1)) # FALSE

# When some elements of the `x` input are not present in `values`,
# `vld_subset()` returns FALSE
vld_subset(c(1, 2, 3, 4), c(3, 2, 1)) # FALSE
vld_superset(c(1, 2, 3, 4), c(3, 2, 1)) # TRUE

# When some elements of the `values` input are not present in `x`,
# `vld_superset()` returns FALSE

vld_subset(c(1, 2, 3), c(3, 2, 1, 4)) # TRUE
vld_superset(c(1, 2, 3), c(3, 2, 1, 4)) # FALSE

# An empty set is considered a subset of any set, and any set is a superset of an empty set.
vld_subset(c(), c("apple", "banana"))  # TRUE
vld_superset(c("apple", "banana"), c())  # TRUE

## -----------------------------------------------------------------------------
vld_orderset(c("A", "B", "C"),  c("A", "B", "C", "D")) # TRUE
vld_orderset(c("C", "B", "A"),  c("A", "B", "C", "D")) # FALSE
vld_orderset(c("A", "C"),  c("A", "B", "C", "D")) # TRUE

## -----------------------------------------------------------------------------
vld_not_empty(c()) # FALSE
vld_not_empty(list()) # FALSE
vld_not_empty(data.frame()) # FALSE
vld_not_empty(data.frame(a = 1:3, b = 4:6)) # TRUE


vld_not_any_na(data.frame(a = 1:3, b = 4:6)) # TRUE
vld_not_any_na(data.frame(a = c(1, NA, 3), b = c(4, 5, 6))) # FALSE

## -----------------------------------------------------------------------------
vld_unique(c(1, 2, 3, 4)) # TRUE
vld_unique(c(1, 2, 2, 4)) # FALSE

## -----------------------------------------------------------------------------
vld_length(c(1, 2, 3), length = 2, upper = 5)  # TRUE
vld_length(c("a", "b"), length = 3)  # FALSE

vld_length(list(a = 1, b = 2, c = 3), length = 2, upper = 4) # TRUE
vld_length(list(a = 1, b = 2, c = 3), length = 4) # FALSE

# 2 columns
vld_length(data.frame(x = 1:3, y = 4:6), length = 1, upper = 3)  # TRUE
vld_length(data.frame(x = 1:3, y = 4:6), length = 3)  # FALSE    

# length of NULL is 0
vld_length(NULL, length = 0) # TRUE
vld_length(NULL, length = 1) # FALSE

## -----------------------------------------------------------------------------
a <- integer(0)
b <- numeric(0)
vld_compatible_lengths(a, b) # TRUE

a <- 1
b <- 2
vld_compatible_lengths(a, b) # TRUE

a <- 1:3
b <- 1:3
vld_compatible_lengths(a, b) # TRUE

b <- 1
vld_compatible_lengths(a, b) # TRUE

b <- 1:2
vld_compatible_lengths(a, b) # FALSE

b <- 1:6
vld_compatible_lengths(a, b) # FALSE

## -----------------------------------------------------------------------------
x <- data.frame(id = c(1, 2, 3), value_x = c("A", "B", "C"))
y <- data.frame(id = c(1, 2, 3), value_y = c("D", "E", "F"))
vld_join(x, y, by = "id") # TRUE

# Perform a join that reduces the number of rows 
y <- data.frame(id = c(1, 2, 1), value_y = c("D", "E", "F"))
vld_join(x, y, by = "id") # FALSE

