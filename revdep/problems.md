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

