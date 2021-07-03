# ypr

<details>

* Version: 0.5.1
* GitHub: https://github.com/poissonconsulting/ypr
* Source code: https://github.com/cran/ypr
* Date/Publication: 2020-07-10 17:10:02 UTC
* Number of recursive dependencies: 74

Run `revdep_details(, "ypr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `expected` is NULL
      ── Failure (test-tabulate.R:147:3): ypr_tabulate_yield ─────────────────────────
      chk::check_data(...) is not NULL
      
      `actual` is an S3 object of class <tbl_df/tbl/data.frame>, a list
      `expected` is NULL
      ── Failure (test-tabulate.R:181:3): ypr_tabulate_biomass ───────────────────────
      chk::check_data(...) is not NULL
      
      `actual` is an S3 object of class <tbl_df/tbl/data.frame>, a list
      `expected` is NULL
      
      [ FAIL 7 | WARN 0 | SKIP 0 | PASS 168 ]
      Error: Test failures
      Execution halted
    ```

