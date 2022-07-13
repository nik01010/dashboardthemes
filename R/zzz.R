.onAttach <- function(libname, pkgname){
  warningMessage <- paste(
    "WARNING: the 'dashboardthemes' package is no longer being maintained as of version 1.1.6, and will eventually be removed from CRAN.",
    "It is recommended that users switch over to the 'bslib' or 'fresh' theming packages available on CRAN."
  )

  packageStartupMessage(warningMessage)
}
