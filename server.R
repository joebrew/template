library(shiny)
library(knitr)

# Define server
shinyServer(function(input, output) {
  
  # Set seed
  set.seed(sample(1:10000, 1))
  
  # Function to get words
  joe <- function(document_type,
                  amount,
                  originator,
                  witness){
    x <- list(document_type, amount, originator, witness)
    return(x)
  }
  
  # Run output
    output$downloadPDF <-
    downloadHandler(filename = "report.pdf",
                    content = function(file){
                      # generate PDF
                      knit2pdf("report.Rnw")

                      # copy pdf to 'file'
                      file.copy("report.pdf", file)

                      # delete generated files
                      file.remove("report.pdf", "report.tex",
                                  "report.aux", "report.log")

                      # delete folder with plots
                      unlink("figure", recursive = TRUE)
                    },
                    contentType = "application/pdf"
  )
  
})