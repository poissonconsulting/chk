# from https://stevenmortimer.com/the-unfinished-duplicated-function/
new_duplicated <- function(x, incomparables = FALSE, fromLast = FALSE, ...) {
  if (!identical(incomparables, FALSE)) {
    n <- ncol(x)
    nmx <- names(x)
    nmincomparables <- names(incomparables)
    lincomparables <- length(incomparables)
    if (is.null(nmincomparables)) {
      if (lincomparables < n) {
        # pad any incomparables lists with the default value if list is shorter than the number columns in the supplied data.frame
        tmp <- c(incomparables, as.list(rep_len(FALSE, n - lincomparables)))
        names(tmp) <- nmx
        incomparables <- tmp
      }
      if (lincomparables > n) {
        # if the list is unnamed and there are more elements in the list than there are columns, then only first n elements
        warning(paste("more columns in 'incomparables' than x, only using the first", n, "elements"))
        incomparables <- incomparables[1:n]
      }
    } else {
      # for named lists, find match, else default value
      tmp <- as.list(rep_len(FALSE, n))
      names(tmp) <- nmx
      i <- match(nmincomparables, nmx, 0L)
      if (any(i <= 0L)) {
        warning("not all columns named in 'incomparables' exist")
      }
      tmp[i[i > 0L]] <- incomparables[i > 0L]
      incomparables <- tmp[nmx]
    }

    # first determine duplicates, then override when an incomparable value is found in a row since the existence of even 1 incomparable value in a row means it cannot be a duplicate
    res <- duplicated(do.call("paste", c(x, sep = "\r")), fromLast = fromLast)

    # for better performance only bother with the columns that have incomparable values not set to the default: !identical(x, FALSE)
    run_incomp_check <- sapply(incomparables, FUN = function(x) {
      !identical(x, FALSE)
    })
    if (sum(run_incomp_check) > 0L) {
      incomp_check <- mapply(FUN = function(column, incomparables) {
        match(column, incomparables)
      }, x[run_incomp_check], incomparables[run_incomp_check])
      # any rows with an incomparable match means, TRUE, it can override the duplicated result
      overwrite <- apply(data.frame(incomp_check), 1, function(x) {
        any(!is.na(x))
      })
      res[overwrite] <- FALSE
    }

    return(res)
  } else if (length(x) != 1L) {
    duplicated(do.call("paste", c(x, sep = "\r")), fromLast = fromLast)
  } else {
    duplicated(x[[1L]], fromLast = fromLast, ...)
  }
}
