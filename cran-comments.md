chk 0.11.0

## CRAN Repository Policy

- [x] Reviewed CRP revision 6875.

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 44 reverse dependencies (38 from CRAN + 6 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 5 new problems
 * We failed to check 0 packages

The 5 newly failing packages (mcmcr, nlist, readwritesqlite, sims, term) fail because their test suites test for the exact text of chk error messages, which this release improves.
There is no change to the chk API.
One of the five, readwritesqlite, was archived on CRAN on 2025-01-17 at the maintainer's request; revdepcheck still checks its archived tarball.
Patches that pass with both the current and new version of chk are merged on the development repositories of all five packages.
All maintainers have been notified by email.
We will submit patched versions of the packages we maintain (mcmcr, nlist and term) once chk is on CRAN.
