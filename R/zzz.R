#' @importFrom rJava .jpackage
#' @export
.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(name = pkgname, jars = "*")
}