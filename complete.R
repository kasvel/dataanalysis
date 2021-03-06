complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  completedata=data.frame(id=vector("integer",length(id)),nobs=vector("integer",length(id)))
  
  
  for(j in 1:length(id)) {
    filename=sprintf("%03d.csv",id[j])
    fullpath=paste(directory,filename,sep="/")
    data <- read.csv(fullpath)
    goodcases=sum(complete.cases(data))
    completedata$id[j]=id[j]
    completedata$nobs[j]=goodcases

    
  }
  
  
  completedata
  
  
  
  
}