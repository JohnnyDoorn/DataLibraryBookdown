# Source GenerateLinkList.R first!
analysisList

# Used for matching the book links:
unlistedAnalysisList <- unlist(analysisList, recursive = F)
unlistedDataNamesList <- unlist(lapply(analysisList, names))

for (i in seq_along(analysisList)) {
  chapterList <- analysisList[[i]]
  chapterTitle <- names(analysisList)[i]
  file_name <- paste0("myChapters/chapter_", i, ".md")
  # Remove numbers before a period using regular expressions
  chapterTitle <- gsub("\\d+\\.", "", chapterTitle)
  
  cat(paste("#", chapterTitle, "\n\n"), file = file_name)
  
  
  allDataNames <- names(chapterList)
  
  
  for (thisDataName in allDataNames) {
    cat(paste("\n\n##", thisDataName, "\n"), file = file_name, append = TRUE)
    # chapter_content <- chapterList[[thisDataName]][[1]]
    # cat(chapter_content, file = file_name, append = TRUE)
    item_list <- chapterList[[thisDataName]]
    
    cat("|  |  |  |\n", file = file_name, append = TRUE)
    cat("|---|---|---|\n", file = file_name, append = TRUE)
    
    # for (item in item_list) {
    # bullet_point <- paste0(" ", paste(item, collapse = " "))
    # bullet_list <- paste(bullet_list, paste("|", item, "|"), sep = " ")
    result <- paste("|", paste(item_list, collapse = " | "), "|", sep = "")
    
    cat(result, file = file_name, append = TRUE)
    
  }
  
  if (chapterTitle == "Books") {
    
    for (thisBook in bookTitles) {
      
      cat(paste("\n\n##", thisBook, "\n"), file = file_name, append = TRUE)
      
      allDataNames <- bookDatasets[[thisBook]]
      
      matchedBookDataList <- unlistedAnalysisList[match(allDataNames, unlistedDataNamesList)]
      
      for (thisDataName in names(matchedBookDataList)) {
        
        cat(paste("\n\n###", sub(".*\\.", "", thisDataName), "\n"), file = file_name, append = TRUE)
        # chapter_content <- chapterList[[thisDataName]][[1]]
        # cat(chapter_content, file = file_name, append = TRUE)
        cat("|  |  |  |\n", file = file_name, append = TRUE)
        cat("|---|---|---|\n", file = file_name, append = TRUE)
        
        item_list <- matchedBookDataList[[thisDataName]]
        
        # bullet_list <- ""
        # for (item in item_list) {
        #   bullet_point <- paste0(" ", paste(item, collapse = " "))
        #   bullet_list <- paste(bullet_list, paste("|", item, "|"), sep = " ")
        # }
        result <- paste("|", paste(item_list, collapse = " | "), "|", sep = "")
        
        cat(result, file = file_name, append = TRUE)
        
      }
    }
  }
  
}
