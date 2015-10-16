#' Function to retrive data from a scrpR search
#' 
#' Retrive the pmid (PubMed identifier) from a scrpR search.
#' 
#' @param scrpRdat is a scrpR function search result
#' @details The Entrez service is used by default. The 
#' result of the scRapper function is a XML structured output.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @examples puRepmid(scrpR("apoptosis", retmax = 3))
#' @keywords scraper
#' @export puRepmid

puRepmid <- function(scrpRdat = NULL) {
  res.xml.pmid <- xmlSApply(xmlRoot(scrpRdat), function(x) xmlSApply(x, xmlValue))
  as.vector(res.xml.pmid[["IdList"]])
}