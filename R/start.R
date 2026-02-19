.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to the PLSC 309 tutorials!")
  options(shiny.launch.browser = TRUE)
  options(tutorial.external.browser = TRUE)
}