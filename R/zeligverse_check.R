#' Check all zeligverse packages
#'
#' @param pkgs character vector of packages to test.
#' @param lib_dir character string with the directory where the packages are
#'   stored. If missing, library is found with \code{\link{.Library}}. The
#'   first library found is used.
#'
#' @importFrom devtools check
#' @export

zeligverse_check <- function(pkgs = core,
                             lib_dir) {
    if (missing(lib_dir))
        lib_dir <- .libPaths()[[1]]
    libs <- sprintf('R CMD check %s/%s', lib_dir, pkgs)

    for (i in libs) {
        system(i)
    }
       # check(i)
}
