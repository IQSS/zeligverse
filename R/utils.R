#' @source tidyverse
#' @keywords internal

startup_message <- function(...) {
    if (isTRUE(getOption("tidyverse.quiet")))
        return()

    packageStartupMessage(...)
}

#' @source tidyverse
#' @keywords internal

bullets <- function(...) {
    message(paste0(" * ", ..., collapse = "\n"))
}
