#' @export
loom<-function(){
    activeDoc<- rstudioapi::getSourceEditorContext()
    rstudioapi::documentSave(id = activeDoc)
    rmarkdown::render(activeDoc$path, output_format = "all")
}
