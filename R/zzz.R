#' @importFrom rJava .jpackages
#' @export
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(name = pkgname, jars = "*")
}