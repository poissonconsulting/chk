## Test environments

release 4.3.1

* OSX (local) - release
* OSX (actions) - release
* Ubuntu (actions) - 3.6 to 4.1, oldrel, release and devel
* Windows (actions) - release
* Windows (winbuilder) - devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## CRAN Package Check Results

Fixed test failing on change in behavior in `is.atomic(NULL)`

```
  ── Failure ('test-chk-atomic.R:5:3'): vld_atomic ───────────────────────────────
  vld_atomic(NULL) is not TRUE
  
  `actual`: FALSE
  `expected`: TRUE
```  

## revdepcheck results

We checked 33 reverse dependencies (27 from CRAN + 6 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

