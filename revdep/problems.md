# biodbKegg

<details>

* Version: 1.6.1
* GitHub: https://github.com/pkrog/biodbKegg
* Source code: https://github.com/cran/biodbKegg
* Date/Publication: 2023-08-02
* Number of recursive dependencies: 125

Run `revdepcheck::revdep_details(, "biodbKegg")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure ('test_700_reaction.R:16:1'): We can search for an entry by name. ───
      id %in% ids is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      While searching for entry R00105 by name "ATP:NADH 2'-phosphotransferase".
      Backtrace:
          ▆
       1. ├─base::do.call(fct, params)
       2. └─biodb (local) `<fn>`(conn = `<KggRctnC>`, opt = `<named list>`)
       3.   └─testthat::expect_true(id %in% ids, msg)
      
      [ FAIL 12 | WARN 0 | SKIP 0 | PASS 1315 ]
      Error: Test failures
      Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

