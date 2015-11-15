corr <- function(directory, threshold = 0) {
  wd <- getwd()
  if (directory == "specdata") {
    setwd("/media/vikki/Flex/Coursera/R/specdata/")
  }
  
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  ids <- complete_table$id[nobs > threshold]
  files <- dir()
  
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  
  j <- 1
  for(i in ids) {
    current_file <- read.csv(files[i], header = TRUE)
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  setwd(wd)
  corr_vector
}
