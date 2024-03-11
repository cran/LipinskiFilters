#' Assess drug-likeness
#'
#' This function assesses the drug-likeness of molecules based on calculated molecular properties.
#'
#' @param properties_df Data frame with molecular properties.
#' @return Data frame with an additional column indicating whether each molecule is drug-like or not.
#' @export
assess_drug_likeness <- function(properties_df) {
  violations <- rowSums(properties_df[, c("MW", "nHBDon", "nHBAcc", "TopoPSA", "ALogP")] > c(500, 5, 10, 140, 5))
  properties_df$DrugLikeness <- ifelse(violations <= 1, "Pass", "Fail")
  return(properties_df)
}

#' @examples
#' assess_drug_likeness(properties_df)