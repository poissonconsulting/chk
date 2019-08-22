## Test environments

release 3.6.1

* OS X (local) - release

* Ubuntu (travis) - oldrelease, release and devel
* Ubuntu (rhub) - release

* Windows (appveyor) - release
* Windows (win-builder) - release and devel
* Windows (rhub) - devel

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a resubmission of a new release.

I have unwrapped all examples from \dontrun except err() which is wrapped by \donttest because it throws an error (this behaviour is tested using testthat).
