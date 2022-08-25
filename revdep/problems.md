# biodbKegg

<details>

* Version: 1.2.0
* GitHub: https://github.com/pkrog/biodbKegg
* Source code: https://github.com/cran/biodbKegg
* Date/Publication: 2022-04-26
* Number of recursive dependencies: 124

Run `revdep_details(, "biodbKegg")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure (???): The peak table is correct. ───────────────────────────────────
      any(vapply(entries, is.null, FUN.VALUE = TRUE)) is not FALSE
      
      `actual`:   TRUE 
      `expected`: FALSE
      One of the entries is NULL.
      Backtrace:
          ▆
       1. ├─base::do.call(fct, params)
       2. └─biodb (local) `<fn>`(conn = `<KggRctnC>`, opt = `<named list>`)
       3.   └─testthat::expect_false(...)
      
      [ FAIL 123 | WARN 0 | SKIP 0 | PASS 756 ]
      Error: Test failures
      Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

