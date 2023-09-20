#' This function gets an AlphaFold2 predicted structure
#' @param uniprot_id A UniProt Accession Number for which the Alphafold predicted structure is desired
#' 
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom utils download.file
#' 
#' @return A .pdb file from the AlphaFold2 Database
#' @examples
#' \dontrun{
#' getalphafold2(uniprot_id = "P02540")
#' }
#' @export
get_alphafold2 <- function(uniprot_id) {
  
  url <- "https://alphafold.ebi.ac.uk/api/prediction/"
  
  url <- paste0(url, uniprot_id)
  
  data <- httr::GET(url = url)
  
  if (data$status_code != 200) {
    print("There is not an AlphaFold predicted structure for this accession number. Please select a different protein.")
  } else {
    data <- jsonlite::fromJSON(httr::content(data, "text"))
    
    utils::download.file(url = data$pdbUrl,
                         destfile = paste0("./", "AlphaFold_Structure.pdb"))
  }
}