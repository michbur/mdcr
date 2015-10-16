#' Helper function to select a service for data retrival
#' 
#' Sets the options for an R environment to retrive data from a defined source.
#' 
#' @param sl is the service name (e.g., Entrez)
#' @details This function sets the URL of a scientific web service to be used 
#' for the data retrival. Several data sources have been build durig the past 
#' few decades. The Entrez service is one of the most popular.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Eric Sayers, The E-utilities In-Depth: Parameters, Syntax and More, 2015, http://www.ncbi.nlm.nih.gov/books/NBK25499/
#' @keywords service
#' @export seRvice

# Service defintions
# Naming convention:
# Servicename.function.type, e.g.,
# The *URL* for the *service location* of *Entrez* is Entrez.service.url
# Note the the service name may have capital letters (e.g., Entrez)

seRvice <- function(sl = "Entrez") {
	if(sl == "Entrez") { 
	      options("Entrez.service.url" = "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/")
	      message("Entrez succesfully chosen as service")
	      } else {
		      stop("Unknown service! Check spelling!")
		      }
}