#' Create Lipinski plots
#'
#' This function creates plots illustrating the distribution of molecular properties
#' and the pass/fail status of Lipinski's Rule of Five.
#'
#' @import cowplot
#' @import ggplot2
#' @param properties_df Data frame with molecular properties and pass/fail status.
#' @return A grid of plots showing distributions and pass/fail status.
#' @export
create_lipinski_plots <- function(properties_df) {
  # Define pass/fail rule
  pass_rule <- with(properties_df, 
                    MW <= 500 & 
                      nHBDon <= 5 & 
                      nHBAcc <= 10 & 
                      ALogP <= 5)
  properties_df$Pass <- ifelse(pass_rule, "Pass", "Fail")
  
  # Plot molecular weight distribution
  plot_molecular_weight <- ggplot(properties_df, aes(x = MW)) +
    geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
    labs(title = "Distribution of Molecular Weight",
         x = "Molecular Weight", y = "Frequency") +
    theme_minimal()
  
  # Plot number of hydrogen bond donors distribution
  plot_num_hbd <- ggplot(properties_df, aes(x = nHBDon)) +
    geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
    labs(title = "Distribution of Hydrogen Bond Donors",
         x = "Number of HBD", y = "Frequency") +
    theme_minimal()
  
  # Plot number of hydrogen bond acceptors distribution
  plot_num_hba <- ggplot(properties_df, aes(x = nHBAcc)) +
    geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
    labs(title = "Distribution of Hydrogen Bond Acceptors",
         x = "Number of HBA", y = "Frequency") +
    theme_minimal()
  
  # Plot ALogP distribution
  plot_log_p <- ggplot(properties_df, aes(x =ALogP)) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
    labs(title = "Distribution of ALogP",
         x = "ALogP", y = "Frequency") +
    theme_minimal()
  
  # Plot Lipinski filter pass/fail
  plot_pass_fail <- ggplot(properties_df, aes(x = factor(Pass), fill = factor(Pass))) +
    geom_bar() +
    labs(title = "Lipinski Filter Pass/Fail",
         x = "Pass/Fail", y = "Count") +
    theme_minimal()
  
  # Arrange plots in a grid
  plot_grid(plot_molecular_weight, plot_num_hbd, plot_num_hba, plot_log_p, plot_pass_fail, ncol = 2)
}

# Define global variables
MW <- NULL
nHBDon <- NULL
nHBAcc <- NULL
ALogP <- NULL
Pass <- NULL

#' @examples
#' create_lipinski_plots(properties_df)