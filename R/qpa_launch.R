#' Launch a QPA Tutorial in the Browser
#'
#' Opens a QPA tutorial in your default web browser. This is the recommended
#' way to run tutorials if you are using assistive technology or prefer working
#' in a browser rather than RStudio's internal viewer.
#'
#' @param tutorial A number (1-19) or a name matching part of the tutorial
#'   folder name (e.g., "bivariateCat", "regression", "logit").
#'
#' @examples
#' \dontrun{
#' qpa_launch(1)             # R Basics Part 1
#' qpa_launch(7)             # Bivariate Description: Categorical
#' qpa_launch("bivariateCat") # same as above, by name
#' qpa_launch("regression")  # matches first tutorial with "regression" in name
#' }
#'
#' @export
qpa_launch <- function(tutorial) {

  # All tutorial directories in order
  tutorials <- c(
    "01-RBasics1",
    "02-RBasicsPart2",
    "03-levels",
    "04-univariateNom",
    "05-univariateOrd",
    "06-univariateInt",
    "07-bivariateCat",
    "08-bivariateCatInt",
    "09-bivariateInt",
    "10-hypothesisMeans",
    "11-hypothesisTestsProportions",
    "12-hypothesisCorrelations",
    "13-regressionSimple",
    "14-regressionMultiple",
    "15-factors",
    "16-regressionPresentingResults",
    "17-regressionInteractions",
    "18-logit",
    "19-logitPresentingResults"
  )

  # Resolve tutorial argument to a directory name
  if (is.numeric(tutorial)) {
    if (tutorial < 1 || tutorial > length(tutorials)) {
      stop("Tutorial number must be between 1 and ", length(tutorials), ".")
    }
    dir_name <- tutorials[tutorial]
  } else if (is.character(tutorial)) {
    matches <- tutorials[grepl(tutorial, tutorials, ignore.case = TRUE)]
    if (length(matches) == 0) {
      stop(
        "No tutorial found matching '", tutorial, "'.\n",
        "Available tutorials:\n",
        paste0("  ", seq_along(tutorials), ". ", tutorials, collapse = "\n")
      )
    }
    if (length(matches) > 1) {
      stop(
        "Multiple tutorials match '", tutorial, "':\n",
        paste0("  ", matches, collapse = "\n"),
        "\nPlease be more specific or use the tutorial number."
      )
    }
    dir_name <- matches[1]
  } else {
    stop("'tutorial' must be a number or a character string.")
  }

  # Launch via learnr with browser = TRUE
  learnr::run_tutorial(
    name = dir_name,
    package = "qpaTutorials",
    shiny_args = list(launch.browser = TRUE)
  )
}


#' List Available QPA Tutorials
#'
#' Prints a numbered list of all available tutorials with their titles.
#'
#' @examples
#' \dontrun{
#' qpa_list()
#' }
#'
#' @export
qpa_list <- function() {
  tutorials <- data.frame(
    Number = 1:19,
    Directory = c(
      "01-RBasics1", "02-RBasicsPart2", "03-levels",
      "04-univariateNom", "05-univariateOrd", "06-univariateInt",
      "07-bivariateCat", "08-bivariateCatInt", "09-bivariateInt",
      "10-hypothesisMeans", "11-hypothesisTestsProportions",
      "12-hypothesisCorrelations", "13-regressionSimple",
      "14-regressionMultiple", "15-factors",
      "16-regressionPresentingResults", "17-regressionInteractions",
      "18-logit", "19-logitPresentingResults"
    ),
    Title = c(
      "R Basics: Part 1",
      "R Basics: Part 2",
      "Levels of Measurement",
      "Univariate Description: Nominal Variables",
      "Univariate Description: Ordinal Variables",
      "Univariate Description: Interval Variables",
      "Bivariate Description: Two Categorical Variables",
      "Bivariate Description: Categorical and Interval Variables",
      "Bivariate Description: Two Interval Variables",
      "Hypothesis Tests: Means",
      "Hypothesis Tests: Proportions",
      "Hypothesis Tests: Correlations",
      "Regression: Simple",
      "Regression: Multiple",
      "Factors",
      "Regression: Presenting Results",
      "Regression: Interactions",
      "Logistic Regression",
      "Logistic Regression: Presenting Results"
    )
  )

  cat("QPA Tutorials\n")
  cat("Use qpa_launch(number) to open a tutorial in your browser.\n\n")
  for (i in seq_len(nrow(tutorials))) {
    cat(sprintf("%2d. %s\n", tutorials$Number[i], tutorials$Title[i]))
  }
  invisible(tutorials)
}
