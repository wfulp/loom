#' @export
loom<-function(){
    activeDoc<-rstudioapi::getActiveDocumentContext()
    rmarkdown::render(activeDoc$path, output_format = "all")
}


