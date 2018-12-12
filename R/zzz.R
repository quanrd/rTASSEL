#' @importFrom rJava .jpackage
#' @export
.onLoad <- function(libname, pkgname) {
    packageStartupMessage(
        paste0(
            "\n",
            "Welcome to rTASSEL\n\n",
            "--- NOTE ---\n",
            "Keep in mind that this package is in the early\n",
            "stages of development and some functionalities\n",
            "may not work..."
        )
    )
    rJava::.jpackage(pkgname, lib.loc = libname)
}
