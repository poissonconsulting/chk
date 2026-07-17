# mcmcr (0.6.2)

* GitHub: <https://github.com/poissonconsulting/mcmcr>
* Email: <mailto:joe@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/mcmcr>

Run `revdepcheck::revdep_details(, "mcmcr")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         2. │ └─testthat:::expect_condition_matching_(...)
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─mcmcr::chk_mcmcr(1)
         8.   └─chk::chk_s3_class(x, "mcmcr", x_name = x_name)
         9.     └─chk::abort_chk(...)
        10.       └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        11.         └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 7 | WARN 0 | SKIP 3 | PASS 418 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# nlist (0.4.0)

* GitHub: <https://github.com/poissonconsulting/nlist>
* Email: <mailto:joe@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/nlist>

Run `revdepcheck::revdep_details(, "nlist")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         2. │ └─testthat:::expect_condition_matching_(...)
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─nlist::chk_nlists(list())
         8.   └─chk::chk_s3_class(x, "nlists", x_name = x_name)
         9.     └─chk::abort_chk(...)
        10.       └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        11.         └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 4 | WARN 0 | SKIP 1 | PASS 411 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# readwritesqlite (0.2.0)

* GitHub: <https://github.com/poissonconsulting/readwritesqlite>
* Email: <mailto:joe@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/readwritesqlite>

Run `revdepcheck::revdep_details(, "readwritesqlite")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─readwritesqlite::chk_sqlite_conn(1)
         8.   └─chk::chkor_vld(...)
         9.     └─chk:::chkor_quos(quos)
        10.       └─chk::abort_chk(msg)
        11.         └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        12.           └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 2 | WARN 37 | SKIP 3 | PASS 593 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# rtide (0.0.11)

* GitHub: <https://github.com/millerlp/rtide>
* Email: <mailto:contact@lukemiller.org>
* GitHub mirror: <https://github.com/cran/rtide>

Run `revdepcheck::revdep_details(, "rtide")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘spelling.R’
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         3. │   └─testthat:::expect_condition_matching_(...)
         4. │     └─testthat:::quasi_capture(...)
         5. │       ├─testthat (local) .capture(...)
         6. │       │ └─base::withCallingHandlers(...)
         7. │       └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         8. └─rtide::tide_stations(1, rtide::harmonics)
         9.   └─chk::chk_s3_class(stations, "character")
        10.     └─chk::abort_chk(...)
        11.       └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        12.         └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 36 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# sims (0.0.4)

* GitHub: <https://github.com/poissonconsulting/sims>
* Email: <mailto:audrey.beliveau@uwaterloo.ca>
* GitHub mirror: <https://github.com/cran/sims>

Run `revdepcheck::revdep_details(, "sims")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─sims::sims_simulate("x <- y", 1)
         8.   └─nlist::chk_nlist(constants)
         9.     └─chk::chk_s3_class(x, "nlist", x_name = x_name)
        10.       └─chk::abort_chk(...)
        11.         └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        12.           └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 1 | WARN 2 | SKIP 40 | PASS 52 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# term (0.3.7)

* GitHub: <https://github.com/poissonconsulting/term>
* Email: <mailto:joe@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/term>

Run `revdepcheck::revdep_details(, "term")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─term::valid_term(NA_character_)
         8.   └─chk::chkor_vld(vld_s3_class(x, "term"), vld_s3_class(x, "term_rcrd"))
         9.     └─chk:::chkor_quos(quos)
        10.       └─chk::abort_chk(msg)
        11.         └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        12.           └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 1 | WARN 0 | SKIP 1 | PASS 545 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# tidyplus (0.2.0)

* GitHub: <https://github.com/poissonconsulting/tidyplus>
* Email: <mailto:ayla@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/tidyplus>

Run `revdepcheck::revdep_details(, "tidyplus")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. └─tidyplus::duplicates("a")
         8.   └─chk::check_data(.data)
         9.     └─chk::chk_data(x, x_name = x_name)
        10.       └─chk::abort_chk(x_name, " must be a data.frame", x = x)
        11.         └─chk::err(..., n = n, tidy = tidy, class = "chk_error", call = call)
        12.           └─rlang::abort(msg, class = class, !!!args[named], call = call)
       
       [ FAIL 1 | WARN 0 | SKIP 4 | PASS 192 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘summarise2.Rd’
     ```

