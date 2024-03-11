#' Predict oral bioavailability
#'
#' This function predicts the oral bioavailability of molecules based on calculated molecular properties.
#'
#' @param properties_df Data frame with molecular properties.
#' @return Data frame with an additional column indicating whether each molecule has high or low oral bioavailability.
#' @export
predict_oral_bioavailability <- function(properties_df) {
  properties_df$OralBioavailability <- ifelse(properties_df$nHBDon <= 5 & properties_df$nHBAcc <= 10 & properties_df$MW <= 500 & properties_df$ALogP <= 5, "High", "Low")
  return(properties_df)
}

#' @examples
#' predict_oral_bioavailability(properties_df)