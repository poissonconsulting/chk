## Test environments

release 4.0.2

* OSX (local) - release
* OSX (actions) - oldrel, release and devel
* Ubuntu (actions) - 3.3 to release
* Windows (actions) - release
* Windows (winbuilder) - devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## CRAN Package Check Results

**Fixed** CRAN Package Check Results

Check Details

Version: 0.5.0 
Check: tests 
Result: ERROR 
     Running ‘testthat.R’ [8s/10s]
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
     > library(testthat)
     > library(chk)
     > 
     > test_check("chk")
     ── 1. Failure: chk_join (@test-chk-join.R#38) ─────────────────────────────────
     `object` threw an error with unexpected message.
     Expected match: "^All rows in `data.frame[(]z [=] 1[)]` must match at least one in: <data.frame>."
     Actual message: "All rows in `data.frame(z = 1)` must match at least one in: <df[,1]>.\nUse `rlang::last_error()$y` to show the object compared to."
     Backtrace:
     1. chk::expect_chk_error(...)
     7. chk::chk_join(data.frame(z = 1), data.frame(z = 2), by = "z")
     8. chk::abort_chk(...)
     9. chk::err(..., n = n, tidy = tidy, .subclass = "chk_error")
     10. rlang::exec(abort, msg, .subclass = .subclass, !!!args[named])
     
     ══ testthat results ═══════════════════════════════════════════════════════════
     [ OK: 965 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
     1. Failure: chk_join (@test-chk-join.R#38) 
     
     Error: testthat unit tests failed
     Execution halted 
Flavor: r-devel-linux-x86_64-fedora-gcc

## Test environments

release 4.0.0

* OSX (local) - release
* OSX (actions) - release and devel
* Ubuntu (actions) - 3.3 to release
* Windows (winbuilder) - devel
* Windows (actions) - release

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse Dependencies

✓ dbflobr 0.1.0                          ── E: 0     | W: 0     | N: 0    
✓ dttr2 0.3.0                            ── E: 0     | W: 0     | N: 0    
✓ extras 0.0.1                           ── E: 0     | W: 0     | N: 0    
✓ fishbc 0.0.1                           ── E: 0     | W: 0     | N: 1    
✓ flobr 0.2.1                            ── E: 0     | W: 0     | N: 0    
✓ klexdatr 0.1.0                         ── E: 0     | W: 0     | N: 0    
✓ mcmcderive 0.1.0                       ── E: 0     | W: 0     | N: 1    
✓ mcmcr 0.3.0                            ── E: 0     | W: 0     | N: 0 
✓ nlist 0.2.0                            ── E: 0     | W: 0     | N: 0       
✓ readwritesqlite 0.1.2                  ── E: 0     | W: 0     | N: 0 
✓ rpdo 0.3.1                             ── E: 0     | W: 0     | N: 0    
✓ rtide 0.0.8                            ── E: 0     | W: 0     | N: 0    
✓ shinyypr 0.0.2                         ── E: 0     | W: 0     | N: 0    
✓ ssdtools 0.3.0                         ── E: 1     | W: 0     | N: 0    
✓ term 0.2.0                             ── E: 0     | W: 0     | N: 0    
✓ tinter 0.1.0                           ── E: 0     | W: 0     | N: 0    
✓ ypr 0.5.1                              ── E: 0     | W: 0     | N: 0

OK: 17                                                                  
BROKEN: 0
