#' @export
loom<-function(){

    activeDoc<- rstudioapi::getSourceEditorContext()
    rstudioapi::documentSave(id = activeDoc)
    file_full_path <- path.expand(activeDoc$path)

    output <- system(
            paste0("Rscript -e \"outputdocs<-rmarkdown::render('",file_full_path,"', output_format = 'all');cat(outputdocs, sep='_________')\""),
            intern = TRUE)

    outputdocs <- strsplit(output[length(output)], split = "_________")[[1]]

    for(doc in outputdocs)
        rstudioapi::viewer(doc)

}
