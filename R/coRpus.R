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

coRpus <- function(source = NULL) {
  # create a corpus source from as DataframeSource from the textinput data
  corpus.source <- DataframeSource(data.frame(text = source))
  corpus <- Corpus(corpus.source)
  # Create document term matrix
  corpus.DTM <- DocumentTermMatrix(corpus, control = list(weighting = weightTf, stopwords = TRUE))
  corpus.DTM
}