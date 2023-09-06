analysisList

for (i in seq_along(analysisList)) {
  chapterList <- analysisList[[i]]
  chapterTitle <- names(analysisList)[i]
  file_name <- paste0("myChapters/chapter_", i, ".md")
  # Remove numbers before a period using regular expressions
  chapterTitle <- gsub("\\d+\\.", "", chapterTitle)

  cat(paste("#", chapterTitle, "\n\n"), file = file_name)
  
  
  for (thisDataName in names(chapterList)) {
    cat(paste("\n\n##", thisDataName, "\n"), file = file_name, append = TRUE)
    # chapter_content <- chapterList[[thisDataName]][[1]]
    # cat(chapter_content, file = file_name, append = TRUE)
    
    item_list <- chapterList[[thisDataName]]
    
    bullet_list <- ""
    for (item in item_list) {
      bullet_point <- paste0(" ", paste(item, collapse = " "))
      bullet_list <- paste(bullet_list, paste("|", item, "|"), sep = " ")
    }
    
    cat(bullet_list, file = file_name, append = TRUE)
    
  }
  
  if (chapterTitle == "Books") {
    bookTitles <- c("Field - Discovering Statistics",
                    "Moore, McCabe, & Craig - Introduction to the Practice of Statistics")
    for (thisBook in bookTitles) {
      
      cat(paste("\n\n##", thisBook, "\n"), file = file_name, append = TRUE)
      thisFile <- gsub(x = "~/GitHubStuff/jasp-desktop/Resources/Data Sets/Data Library/Books/INSERTBOOKTITLE/license.txt", 
                       pattern = 'INSERTBOOKTITLE',
                       replacement = thisBook)
      x <- readChar(thisFile, file.info(thisFile)$size)
      cat(x,  file = file_name, append = TRUE)
    }
  }

}
