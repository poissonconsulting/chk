chk 0.11.0

## CRAN Repository Policy

- [ ] Reviewed CRP revision 6875.

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 45 reverse dependencies (39 from CRAN + 6 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 8 new problems
 * We failed to check 0 packages

The 8 newly failing packages (extras, mcmcr, nlist, readwritesqlite, rtide, sims, term, tidyplus) fail because their test suites test for the exact text of chk error messages, which this release improves.
There is no change to the chk API.
Patches that pass with both the current and new version of chk have been prepared for all 8 packages: 2 are already merged on the development repositories, 4 are pull requests to packages we maintain, and the maintainers of the remaining 2 (rtide and sims) have been notified by issue and pull request.
We will submit patched versions of the 6 packages we maintain once chk is on CRAN.
