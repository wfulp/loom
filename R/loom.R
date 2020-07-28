#' @export
loom<-function(){

    activeDoc<- rstudioapi::getSourceEditorContext()
    rstudioapi::documentSave(id = activeDoc)
    file_full_path <- path.expand(activeDoc$path)

    outputfiles_rda <- normalizePath(
        tempfile(fileext = ".rds"),
        winslash = "/",mustWork = FALSE)

    system(paste0("Rscript -e \"",
                  "outputdocs<-rmarkdown::render('",
                  file_full_path,"', output_format = 'all');",
                  "saveRDS(outputdocs, '",outputfiles_rda,"')",
                  "\""))

    outputdocs <- readRDS(outputfiles_rda)

    for(doc in outputdocs)
        rstudioapi::viewer(doc)

}
