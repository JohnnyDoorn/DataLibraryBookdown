analysisList

for (i in seq_along(analysisList)) {
  chapterList <- analysisList[[i]]
  chapterTitle <- names(analysisList)[i]
  file_name <- paste0("myChapters/chapter_", i, ".md")
  
  cat(paste("#", chapterTitle, "\n\n"), file = file_name)
  
  
  for (thisDataName in names(chapterList)) {
    cat(paste("\n\n##", thisDataName, "\n"), file = file_name, append = TRUE)
    # chapter_content <- chapterList[[thisDataName]][[1]]
    # cat(chapter_content, file = file_name, append = TRUE)
    
    item_list <- chapterList[[thisDataName]]
    
    bullet_list <- ""
    for (item in item_list) {
      bullet_point <- paste0(" ", paste(item, collapse = " "))
      bullet_list <- paste(bullet_list, bullet_point, sep = " | ")
    }
    
    # P
    # table_rows <- ""
    # for (item in item_list) {
    #   table_row <- paste0("| ", paste(item, collapse = " | "), " |")
    #   table_rows <- paste(table_rows, table_row, sep = " ")
    # }
    # 
    # table_header <- "|  |  |  | "
    # table_separator <- "| --- | --- | --- |"
    # table <- paste(table_header, table_separator, table_rows, sep = " ")
    # 
    # Print the table
    cat(bullet_list, file = file_name, append = TRUE)
    
  }

}
