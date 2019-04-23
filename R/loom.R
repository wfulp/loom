#' @export
loom<-function(){
    activeDoc<-rstudioapi::getActiveDocumentContext()
    rstudioapi::documentSave(id = activeDoc)
    rmarkdown::render(activeDoc$path, output_format = "all")
}


