#' Update zeligverse packages
#'
#' This will check to see if all zeligverse packages (and optionally, their
#' dependencies) are up-to-date, and will install after an interactive
#' confirmation.
#'
#' @param recursive If \code{TRUE}, will also check all dependencies of
#'   zeligverse packages.
#'
#' @importFrom dplyr filter
#' @export
#' @source tidyverse
#' @examples
#' \dontrun{
#' zeligverse_update()
#' }
zeligverse_update <- function(recursive = FALSE) {

    deps <- zeligverse_deps(recursive)
    behind <- dplyr::filter(deps, behind)

    if (nrow(behind) == 0) {
        message("All zeligverse packages up-to-date")
        return(invisible())
    }

    message("The following packages are out of date:")
    bullets(format(behind$package), " (", behind$local, " -> ", behind$cran, ")")

    message("Update now?")
    do_it <- utils::menu(c("Yes", "No")) == 1

    if (!do_it) {
        return(invisible())
    }

    utils::install.packages(
        behind$package,
        quiet = TRUE,
        dependencies = if (recursive) FALSE else NA
    )

    invisible()
}

#' List all zeligverse dependencies
#'
#' @param recursive If \code{TRUE}, will also list all dependencies of
#'   zeligverse packages.
#' @source tidyverse
#'
#' @importFrom dplyr %>%
#' @importFrom purrr map2_lgl map_chr
#' @importFrom tibble tibble
#' @importFrom utils available.packages
#' @importFrom tools package_dependencies
#' @export

zeligverse_deps <- function(recursive = FALSE) {
    pkgs <- available.packages()
    deps <- tools::package_dependencies("zeligverse", pkgs,
                                        recursive = recursive)

    pkg_deps <- unique(sort(unlist(deps)))

    base_pkgs <- c(
        "base", "compiler", "datasets", "graphics", "grDevices", "grid",
        "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk",
        "utils"
    )
    pkg_deps <- setdiff(pkg_deps, base_pkgs)

    cran_version <- lapply(pkgs[pkg_deps, "Version"], package_version)
    local_version <- lapply(pkg_deps, utils::packageVersion)

    behind <- purrr::map2_lgl(cran_version, local_version, `>`)

    tibble::tibble(
        package = pkg_deps,
        cran = cran_version %>% purrr::map_chr(as.character),
        local = local_version %>% purrr::map_chr(as.character),
        behind = behind
    )
}
