#' Function to retrive article abstract data
#' 
#' Retrive the article data from a PubMed ID.
#' 
#' @param pmid is a list of PubMed ID (PMID) to look for (e.g., 17284678,9997)
#' @param db is the data base to look for abstracts (e.g., pmc or pubmed)
#' @param service is the service name (e.g., Entrez)
#' @details The function uses internally the seRvice function to set an service,
#' from which the data are retrived. The Entrez service is used by default. The 
#' result of the scRapper function is a XML structured output.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Eric Sayers, The E-utilities In-Depth: Parameters, Syntax and More, 2015, http://www.ncbi.nlm.nih.gov/books/NBK25499/
#' @examples abstR(puRepmid(scrpR("apoptosis", retmax = 3)))
#' @keywords scraper abstract PMID
#' @export abstR

abstR <- function(pmid = NULL, db = "pubmed", service = "Entrez") {
   # use the service function to select a data base / source
   seRvice(sl = service)
   
   pmid.cleaned <- unique(paste0(pmid, collapse = ","))
   
   if(service == "Entrez") {
      service.url <- getOption("Entrez.service.url")
      expression.url <- paste0(service.url, "efetch.fcgi?db=", db, "&id=", pmid.cleaned, "&retmode=xml")
      } else {
	stop("Unknown service! Check spelling!")
      }
      
   # parse the XML structure
   try(xmlTreeParse(file = expression.url, isURL = TRUE))
}