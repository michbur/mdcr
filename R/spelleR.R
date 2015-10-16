#' Function to retrive spelling suggestions
#' 
#' Retrive the pmid (PubMed identifier).
#' 
#' @param expr is expression to look for (e.g., H2AX)
#' @param db is the data base to look for spelling suggestions (e.g., pmc)
#' @param service is the service name (e.g., Entrez)
#' @details The function uses internally the seRvice function to set an service,
#' from which the data are retrived. The Entrez service is used by default. The 
#' result of the scRapper function is a XML structured output.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Eric Sayers, The E-utilities In-Depth: Parameters, Syntax and More, 2015, http://www.ncbi.nlm.nih.gov/books/NBK25499/
#' @keywords scraper
#' @export spelleR

spelleR <- function(expr = NULL, db = "pmc", service = "Entrez") {
   # use the service function to select a data base / source
   seRvice(sl = service)
   if(service == "Entrez") {
      service.url <- getOption("Entrez.service.url")
      expression.url <- paste0(service.url, "espell.fcgi?term=", expr, "&db=", db)
      } else {
	stop("Unknown service! Check spelling!")
      }
      
   # parse the XML structure
   try(xmlTreeParse(file = expression.url, isURL = TRUE))
}