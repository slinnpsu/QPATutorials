# Batch render all QPA tutorials
# Run this script whenever you update a11y.css, a11y.js, or output_formats.R

library(rmarkdown)
library(rprojroot)
setwd(rprojroot::find_rstudio_root_file())


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

base_path <- "inst/tutorials"

for (tut in tutorials) {
  rmd_files <- list.files(
    file.path(base_path, tut),
    pattern = "\\.Rmd$",
    full.names = TRUE
  )
  for (rmd in rmd_files) {
    message("Rendering: ", rmd)
    tryCatch(
      rmarkdown::render(rmd, quiet = TRUE),
      error = function(e) message("ERROR in ", rmd, ": ", e$message)
    )
  }
}

message("Done rendering all tutorials.")