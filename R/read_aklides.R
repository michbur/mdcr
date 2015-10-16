#' Import data from the Aklides platform
#' 
#' Imports a single raw data EXCEL file as exported from the Aklides platform.
#' 
#' @param file_name is the name of the file
#' @details The raw format means that every column corresponds to a specific
#' export value of the Aklides platform
#' @author Stefan Roediger, Michal Burdukiewcz
#' @keywords Aklides
#' @export read_aklides

read_aklides <-
  function(file_name) {
        
    # read raw data
    raw_dat <- read_excel(file_name, skip = 1)
    # clean up column names and make them unique
    colnames(raw_dat) <- make.names(colnames(raw_dat), unique = TRUE)
    # convert non-ascii characters
    colnames(raw_dat) <- iconv(colnames(raw_dat), to="ASCII//TRANSLIT")
    # remove the last three summary rows from the raw data
    dat <- raw_dat[1L:(nrow(raw_dat) - 3), ]
    # Select only columns required for the analysis
    area_dat_raw <- dat[c("X.coord.", "Y.coord.", "Area.um..", 
                          "Spots.n.", "FociOK.n.", 
                          "Spots.n..1", "FociOK.n..1")]
    
    cbind.data.frame(dye = c(rep("FITC", nrow(area_dat_raw)), 
                             rep("APC", nrow(area_dat_raw))),
                     rbind(as.matrix(area_dat_raw[, c("X.coord.", "Y.coord.", "Area.um..", 
                                                      "Spots.n.", "FociOK.n.")]),
                           as.matrix(area_dat_raw[, c("X.coord.", "Y.coord.", "Area.um..",
                                                      "Spots.n..1", "FociOK.n..1")])
                     )
    )
  }
