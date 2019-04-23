#' @export
loom<-function(){
    activeDoc<- rstudioapi::getSourceEditorContext()
    rstudioapi::documentSave(id = activeDoc)
    outputdocs<-rmarkdown::render(activeDoc$path, output_format = "all")

    for(doc in outputdocs)
        rstudioapi::viewer(doc)
}
