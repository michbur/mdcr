#' Function to process text data
#' 
#' Create a word heatmap from article abstract data.
#' 
#' @param source is a set abstrats from the abstR function.
#' @details TBD.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references TBD
#' @examples coRpus()
#' @keywords heatmap
#' @export coRpus
#' @importFrom tm removeWords stemDocument stopwords stripWhitespace tm_map weightTf

coRpus <- function(source = NULL) {
  # create a corpus source from as DataframeSource from the textinput data
  corpus.source <- DataframeSource(data.frame(text = source))
  corpus <- Corpus(corpus.source)
  
  # Remove white spaces
  corpus <- tm_map(corpus, stripWhitespace)
  
  # Remove stopwords (optionally give language as an parameter)
  # TO DO remove also words like study or research
  corpus <- tm_map(corpus, removeWords, stopwords("english"))
  
  # Stemming
  corpus <- tm_map(corpus, stemDocument)
  
  # Create document term matrix
  corpus.DTM <- DocumentTermMatrix(corpus, control = list(weighting = weightTf, stopwords = TRUE))
  corpus.DTM
}
