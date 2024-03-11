#' @name LipinskiVignette
#' @title Lipinski Evaluation of Drug Molecules
#' 
#' This vignette demonstrates the usage of the LipinskiFilters package to evaluate drug molecules according to Lipinski's Rule of Five.
#' 
#' @author George Oche Ambrose
#' @param date Creation date of the vignette: 2/28/2024
#' @seealso \code{\link{load.molecules}}, \code{\link{compute_properties}}, \code{\link{create_lipinski_plots}}, \code{\link{assess_drug_likeness}}, \code{\link{predict_oral_bioavailability}}
#' @format An R Markdown document with code chunks
#' @export
#' @import knitr
#' @examples
#' # Load the LipinskiFilters package
#' library(LipinskiFilters)
#' 
#' # Set working directory containing concatenated compounds in SDF format
#' file <- system.file("extdata", "test.sdf", package = "LipinskiFilters")
#' 
#' # Read sdf molecules
#' mols <- load.molecules(file)
#' 
#' # Computing Molecular Properties
#' # You can compute molecular properties using the compute_properties function. 
#' # Here's an example:
#' properties <- compute_properties(mols)
#' print(properties)
#' 
#' # Creating Lipinski Plots
#' # Visualize Lipinski Rule of Five parameters using the create_lipinski_plots function:
#' create_lipinski_plots(properties)
#' 
#' # Druglikeness evaluation
#' assess_drug_likeness(properties)
#' 
#' # Bioavailability prediction
#' predict_oral_bioavailability(properties)
