#' @importFrom rJava .jpackage
#' @export
.onLoad <- function(libname, pkgname) {
    rJava::.jpackage(pkgname, lib.loc = libname)
}


#' @export
.onAttach <- function(libname, pkgname) {
    packageStartupMessage(
        paste0(
            "Welcome to rTASSEL\n",
            "                 --- NOTE ---\n",
            "Keep in mind that this package is in the early\n",
            "stages of development and some functionalities\n",
            "may not work..."
        )
    )
}