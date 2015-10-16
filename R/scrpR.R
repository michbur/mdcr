#' Function to retrive data from a service
#' 
#' Retrive the pmid (PubMed identifier).
#' 
#' @param expr is expression to look for (e.g., H2AX)
#' @param retmax is the total number of UIDs from the retrieved set to be shown in the XML output
#' @param service is the service name (e.g., Entrez)
#' @details The function uses internally the seRvice function to set an service,
#' from which the data are retrived. The Entrez service is used by default. The 
#' result of the scRapper function is a XML structured output.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Eric Sayers, The E-utilities In-Depth: Parameters, Syntax and More, 2015, http://www.ncbi.nlm.nih.gov/books/NBK25499/
#' @examples scrpR("apoptosis", retmax = 3)
#' @keywords scraper
#' @export scrpR

scrpR <- function(expr = NULL, retmax = 20, service = "Entrez") {
   ifelse(retmax < 1, retmax <- 1, retmax)
   ifelse(retmax > 100000, warning("use different restart value"), retmax)
   # use the service function to select a data base / source
   seRvice(sl = service)
   if(service == "Entrez") {
      service.url <- getOption("Entrez.service.url")
      expression.url <- paste0(service.url, "esearch.fcgi?db=pubmed&term=", expr, "&retmax=", retmax)
      } else {
	stop("Unknown service! Check spelling!")
      }
      
   # parse the XML structure
   try(xmlTreeParse(file = expression.url, isURL = TRUE))
}