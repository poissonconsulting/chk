# biodbKegg

<details>

* Version: 1.6.1
* GitHub: https://github.com/pkrog/biodbKegg
* Source code: https://github.com/cran/biodbKegg
* Date/Publication: 2023-08-02
* Number of recursive dependencies: 126

Run `revdepcheck::revdep_details(, "biodbKegg")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       3.   └─testthat::expect_false(...)
      ── Failure ('test_500_orthology.R:4:5'): We can search entry by name. ──────────
      length(id) > 0 is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      Backtrace:
          ▆
       1. ├─base::do.call(fct, params)
       2. └─biodbKegg (local) `<fn>`(conn = `<KggOrthC>`)
       3.   └─testthat::expect_true(length(id) > 0) at test_500_orthology.R:4:4
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 1282 ]
      Error: Test failures
      Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

