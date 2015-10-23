#' Function to retrive article abstract text
#' 
#' Retrive the abstract texts.
#' 
#' @param abstr is a set of data from the abstR function
#' @param aggr connectate text.
#' @details TBD.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Nolan, D., Temple Lang, 2014. XML and Web Technologies for Data Sciences with R, 1. Springer-Verlag New York.
#' @examples abstR_text(abstR(puRepmid(scrpR("apoptosis", retmax = 3))))
#' @keywords scraper abstract PMID
#' @export abstR_text

abstR_text <- function(abstr = NULL, aggr = TRUE) {
  abstR_xmlRoot <- xmlRoot(abstr)
  # Determine how many article were scraped
  article_number <- length(xmlChildren(abstR_xmlRoot))
  
  sapply(1L:article_number, function(i) {
    xml_abstract <- abstR_xmlRoot[[i]]["MedlineCitation"][[1]]["Article"][[1]]["Abstract"][[1]]["AbstractText"]
    raw_abstract <- as.character(xmlChildren(xml_abstract[[1]])$text)[6]
    raw_abstract
    }
    )
    if(aggr) {paste(raw_abstract, sep = "", collapse = "\"")}
}