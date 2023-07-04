allFiles <- list.files(path = "~/GitHubStuff/JASP_Modules/jasp-data-library//")

myFileLinks <- list()
for (thisFile in allFiles) {
  
  
  subFiles <- list.files(path = paste0("~/GitHubStuff/JASP_Modules/jasp-data-library/", thisFile))
  
  if (paste0(thisFile, ".jasp") %in% subFiles) {
    
    noSpaceFileName <- gsub(x = thisFile, pattern =" ", replacement = "%20")
    
    jaspLink <- "[.jasp](https://github.com/jasp-stats/jasp-data-library/raw/main/FILENAMEHERE/FILENAMEHERE.jasp)"
    
    htmlLink <- "[.html](https://htmlpreview.github.io/?https://github.com/jasp-stats/jasp-data-library/blob/main/FILENAMEHERE/index.html)"
    
    csvLink <- "[.csv](https://raw.githubusercontent.com/jasp-stats/jasp-data-library/main/FILENAMEHERE/FILENAMEHERE.csv)"
    
    
    
    myFileLinks[[thisFile]] <- list(jaspLink = gsub(x = jaspLink, pattern = "FILENAMEHERE", replacement = noSpaceFileName),
                                    htmlLink = gsub(x = htmlLink, pattern = "FILENAMEHERE", replacement = noSpaceFileName),
                                    csvLink = gsub(x = csvLink, pattern = "FILENAMEHERE", replacement = noSpaceFileName))
    
  }
}


analysisNames <- list.files("~/GitHubStuff/jasp-desktop/Resources/Data Sets/Data Library/")
# Extract numbers from the beginning of each string
numbers <- as.numeric(gsub("^([0-9]+).*", "\\1", analysisNames))
# Sort the vector based on the extracted numbers
analysisNames <- analysisNames[order(numbers)]
analysisList <- list()
for (thisAnalysis in analysisNames) {
  
  subFiles <- list.files(path = paste0("~/GitHubStuff/jasp-desktop/Resources/Data Sets/Data Library/", thisAnalysis))
  
  thisAnalysisData <- subFiles[grepl(x = subFiles, pattern = ".csv")]
  thisAnalysisData <- gsub(x = thisAnalysisData, pattern = ".csv", replacement = "")
  
  analysisList[[thisAnalysis]] <- list()
  
  for (thisData in thisAnalysisData) {
    
    analysisList[[thisAnalysis]][[thisData]] <- myFileLinks[[thisData]]
    
  }
}

