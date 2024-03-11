#' Load molecules from an SDF file
#'
#' This function loads molecules from a Structure Data File (SDF) using the \code{\link[rcdk]{load.molecules}} function from the \code{rcdk} package.
#'
#' @param file character string specifying the path to the SDF file.
#' @param molfiles Deprecated. Use 'file' instead.
#' @param aromaticity Deprecated. Use 'typing' instead.
#' @param typing Deprecated. Specify the type of typing to perform.
#' @param isotopes Deprecated. Specify whether isotopes should be loaded.
#' @param verbose Deprecated. Specify whether to print verbose messages.
#' @return A list of molecules.
#' @export
#' @examples
#' \dontrun{
#' # Load molecules from an SDF file
#' mols <- load.molecules("test.sdf")
#' }