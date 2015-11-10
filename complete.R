complete <- function(directory, id = 1:332) {
  wd <- getwd()
  if (directory == "specdata") {
    setwd("/media/vikki/Flex/Coursera/R/specdata/")
  }
  complete_length <- length(id)
  complete_data <- rep(0, complete_length)
  files <- dir()
  j <- 1
  for (i in id) {
    current_file <- read.csv(files[i], header=T)
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  setwd(wd)
  data.frame(id = id, nobs = complete_data)
}
