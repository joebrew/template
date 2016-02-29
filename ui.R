library(shiny)
library(knitr)

# Define UI for application
shinyUI(pageWithSidebar(
  
  ## Application title
  headerPanel("Document-automater!"),
  
  ## Sidebar panel
  sidebarPanel("The Document-automater is Reblendable's internal tool for the production of customizable documentation.",
               br(),
               br()),

  
  ## Main panel
  mainPanel(
    wellPanel(
      selectInput('document_type',
                  'Document type',
                  choices = c('Term sheet',
                              'Contract',
                              'Memorandum of Understanding A',
                              'Memorandum of Understanding B'),
                  selected = 'Term sheet'),
      textInput("amount", "Amount",
                "13,109,032.25"),
      textInput("witness", "Legal Witness",
                "Montaigue Moneybags, JD"),
      textInput("originator","originator",
                "ACME Trampoline Leases, Inc."),
      textInput("signed_by","Signed by",
                "Aren't Jun"),
    textInput("sb2","Other signer",
              "Ronald McDonald")),
    downloadButton("downloadPDF", "Download your document!")
    # downloadButton("downloadHTML", "Download shiny HTML report")
  )
))
