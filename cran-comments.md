chk 0.11.0

## CRAN Repository Policy

- [ ] Reviewed CRP revision 6875.

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 44 reverse dependencies (38 from CRAN + 6 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 7 new problems
 * We failed to check 0 packages

The 7 newly failing packages (mcmcr, nlist, readwritesqlite, rtide, sims, term, tidyplus) fail because their test suites test for the exact text of chk error messages, which this release improves.
There is no change to the chk API.
Patches that pass with both the current and new version of chk are already merged on the development repositories of all 7 packages except sims, where the patch is an open pull request.
All maintainers have been notified by email.
We will submit patched versions of the packages we maintain once chk is on CRAN.
