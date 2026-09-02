chk 0.11.0

## CRAN Repository Policy

- [x] Reviewed CRP revision 6875.

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 44 reverse dependencies (38 from CRAN + 6 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problem
 * We failed to check 0 packages

The one newly failing package, readwritesqlite, fails because its test suite tests for the exact text of chk error messages, which this release improves.
There is no change to the chk API.
readwritesqlite was archived on CRAN on 2025-01-17 at the maintainer's request; revdepcheck still checks its archived tarball.
A patch that passes with both the current and new version of chk is merged on its development repository (poissonconsulting/readwritesqlite#76).
The four packages that were newly failing when this release was previously prepared (mcmcr, nlist, sims and term) have since been updated on CRAN and now pass.
