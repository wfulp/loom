#' @export
loom<-function(){
    activeDoc<- rstudioapi::getSourceEditorContext()
    rmarkdown::render(activeDoc$path, output_format = "all")
}
