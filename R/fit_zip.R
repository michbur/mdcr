#' Fit Poisson and ZIP distributions
#' 
#' Fit Poisson and Zero-Inflated Poisson distributions to data. 
#' 
#' @param x a \code{numeric} count vector
#' @details TBD.
#' @author Stefan Roediger, Michal Burdukiewcz
#' @references Lambert D, \emph{Zero-Inflated Poisson regression, with an 
#' application to defects in manufacturing}. Technometrics. 34(1):1-14.
#' @seealso Parameters of Zero-Inflated Poisson are estimated by 
#' \code{\link[pscl]{zeroinfl}} function.
#' @keywords models
#' @export
#' @importFrom pscl zeroinfl

fit_zip <- function(x) {
  CP <- summary(glm(x ~ 1, family = poisson(link = "log")))
  ZIP <- summary(zeroinfl(x ~ 1, dist = "poisson"))
  
  c(lambdaP = unname(exp(CP[["coefficients"]][, "Estimate"])),
    lambdaZIP = unname(exp(ZIP[["coefficients"]][["count"]][, "Estimate"])),
    p = unname(1 - invlogit(ZIP[["coefficients"]][["zero"]][, "Estimate"])))
}


invlogit <- function(x) {
  1/(1 + exp(-x))
}