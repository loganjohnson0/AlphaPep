#' This function gets an AlphaFold2 predicted structure
#' @param uniprot_id A UniProt Accession Number for which the Alphafold predicted structure is desired
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom utils download.file
#' @importFrom magrittr %>% 
#' @import NGLVieweR
#' 
#' @export
get_alphafold2 <- function(uniprot_id) {
  
  url <- paste0("https://alphafold.ebi.ac.uk/api/prediction/", uniprot_id)
  
  data <- httr::GET(url = url)
  
  if (data$status_code == 200) {
    data <- jsonlite::fromJSON(httr::content(data, "text"))
    
    utils::download.file(url = data$pdbUrl,
                         destfile = paste0("./", "AlphaFold_Structure.pdb"))
  } else {
    print(paste0("There is not an AlphaFold predicted structure for UniProt Accession Number ", 
                 uniprot_id, 
                 ". Please select a different protein."))
  }
  
  NGLVieweR::NGLVieweR(data = "./AlphaFold_Structure.pdb") %>%
    NGLVieweR::addRepresentation(type = "cartoon", 
                                 param = list(
                                   name = "cartoon", 
                                   color = "residueindex")) %>%
    NGLVieweR::stageParameters(backgroundColor = "black") %>%
    NGLVieweR::setQuality("high") %>%
    NGLVieweR::setFocus(0) %>%
    NGLVieweR::setSpin(TRUE) 
}