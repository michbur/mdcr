#' Web scraping and data processing with mdcr
#' 
#' The package imports and processes dataset from image based multiparameter 
#' technologie such as the Aklieds platform (Medipan GmbH) and the VideoScan 
#' platform. Moreover the package contains function to scrap data from large
#' databases such as PubMed and Medline.
#' @references Eric Sayers, The E-utilities In-Depth: Parameters, Syntax and More, 2015, http://www.ncbi.nlm.nih.gov/books/NBK25499/
#' @name mdcr-package
#' @aliases mdcr-package mdc
#' @docType package
#' @author Stefan Roediger, Michal Burdukiewicz.
#' 
#' Maintainer: Stefan Roediger <Stefan.Roediger@@b-tu.de>
#' @keywords package
#' @importFrom readxl read_excel
#' @importFrom reshape2 melt
#' @importFrom tm Corpus
#' @importFrom tm DataframeSource
#' @importFrom tm DocumentTermMatrix
#' @importFrom XML xmlChildren
#' @importFrom XML xmlRoot
#' @importFrom XML xmlSApply
#' @importFrom XML xmlTreeParse
#' @importFrom XML xmlValue
NULL
