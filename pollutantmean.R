pollutantmean <- function(directory, pollutant, id = 1:332) {
  wd <- getwd()
  if (directory == "specdata") {
    setwd("/media/vikki/Flex/Coursera/R/specdata/")
  }
  mean_values <- c()
  files <- dir()
  for (i in id) {
    current_file <- read.csv(files[i], header=T)
    mean_values <- c(mean_values, current_file[!is.na(current_file[, pollutant]), pollutant])
  }
  setwd(wd)
  round(mean(mean_values), 3)
}
