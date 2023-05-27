# biodbKegg

<details>

* Version: 1.6.0
* GitHub: https://github.com/pkrog/biodbKegg
* Source code: https://github.com/cran/biodbKegg
* Date/Publication: 2023-04-25
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
      ── Failure (???): We can search for an entry by name. ──────────────────────────
      id %in% ids is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      While searching for entry K12668 by name "dolichyl-diphosphooligosaccharide---protein glycosyltransferase subunit DAD1/OST2".
      Backtrace:
          ▆
       1. ├─base::do.call(fct, params)
       2. └─biodb (local) `<fn>`(conn = `<KggOrthC>`, opt = `<named list>`)
       3.   └─testthat::expect_true(id %in% ids, msg)
      
      [ FAIL 4 | WARN 2 | SKIP 0 | PASS 1384 ]
      Error: Test failures
      Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

