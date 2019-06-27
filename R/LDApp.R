#' @title LD visualization application
#'
#' @description Runs an interactive visualizer for an LD object
#'
#' @importFrom shiny runApp
#'
#' @export
linkageDiseqApp <- function() {
    appDir <- system.file("shiny-output", "ldApp", package = "rTASSEL")
    if (appDir == "") {
        stop("Could not find example directory. Try re-installing `rTASSEL`.", call. = FALSE)
    }

    shiny::runApp(appDir, display.mode = "normal")
}
