#' Compute molecular properties
#'
#' This function computes molecular properties based on input molecules.
#'
#' @import rcdk
#' @param mols Molecules data.
#' @return Data frame with calculated properties including Molecular Weight (MW), 
#'         number of Hydrogen Bond Donors (nHBDon), number of Hydrogen Bond Acceptors (nHBAcc),
#'         Topological Polar Surface Area (TPSA), and ALogP.
#' @export
compute_properties <- function(mols) {
  # Import necessary functions from 'rcdk' package
  get.desc.categories <- rcdk::get.desc.categories
  get.desc.names <- rcdk::get.desc.names
  eval.desc <- rcdk::eval.desc
  
  # Get descriptor names
  dc <- get.desc.categories()
  dn1 <- get.desc.names(dc[3])
  dn2 <- get.desc.names(dc[5])
  dn3 <- get.desc.names(dc[5])
  dn4 <- get.desc.names(dc[5])
  dn5 <- get.desc.names(dc[3])
  
  # Compute molecular weight
  molecular_weight <- eval.desc(mols, dn1[3])
  
  # Compute hydrogen bond donor
  num_hbd <- eval.desc(mols, dn2[3])
  
  # Compute hydrogen bond acceptor
  num_hba <- eval.desc(mols, dn3[4])
  
  # Compute TPSA
  num_tpsa <- eval.desc(mols, dn4[2])
  
  # Compute ALogP
  log_p <- eval.desc(mols, dn5[15])
  
  # Create a data frame with calculated properties
  properties_df <- data.frame(
    MW = molecular_weight,
    nHBDon = num_hbd,
    nHBAcc = num_hba,
    TPSA = num_tpsa,
    ALogP = log_p$ALogP
  )
  
  return(properties_df)
}

#' @examples
#' mols <- load.molecules("extdata", "test.sdf", package = "LipinskiFilters")
#' properties_df<-compute_properties(mols)
