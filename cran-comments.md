## Test environments

release 4.4.1

* OSX (local) - release
* OSX (actions) - release
* Ubuntu (actions) - 4.0 to 4.2, oldrel, release and devel
* Windows (actions) - release
* Windows (winbuilder) - devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## CRAN Package Check Results

Fixed `vld_join()` failing on devel version - now returns FALSE as expected.

```
Result: ERROR 

    ══ Failed tests ════════════════════════════════════════════════════════════════
    ── Failure ('test-chk-join.R:8:3'): vld_join with by = NULL ────────────────────
    vld_join(data.frame(z = 1), data.frame(z = 1:2), by = NULL) is not FALSE
    
    `actual`:   TRUE 
    `expected`: FALSE
```

## revdepcheck results

We checked 38 reverse dependencies (20 from CRAN + 18 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
