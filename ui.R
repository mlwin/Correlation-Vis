library(shiny)
library(quantmod)
library(ggplot2) 

shinyUI(fluidPage(
  titlePanel("Daily Returns Correlation Vis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter two stocks to examine. 
        Information will be collected from yahoo finance."),
      
      textInput("symb1", "Stock 1", "XLI"),
      
      textInput("symb2", "Stock 2", "GE"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2014-04-01", 
                     end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      actionButton("get", "Submit")
      
      
    ),
    
    mainPanel(plotOutput("plot"), verbatimTextOutput("text1"))
  )
))