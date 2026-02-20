.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Welcome to QPATutorials!\n",
    "These tutorials teach data analysis in R for political science,\n",
    "covering R basics, univariate and bivariate description,\n",
    "hypothesis testing, regression, and logistic regression.\n\n",
    "To see all available tutorials, run: qpa_list()\n",
    "To open a tutorial in your browser, run: qpa_launch(number)\n",
    "Example: qpa_launch(1) opens R Basics Part 1"
  )
  options(shiny.launch.browser = TRUE)
  options(tutorial.external.browser = TRUE)
}