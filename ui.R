library(shiny)
library(quantmod)
library(ggplot2) 

shinyUI(fluidPage(
  titlePanel("Daily Returns Correlation Vis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Please enter two stock symbols below to examine their correlation. (Stock data is downloaded from Yahoo Finance and only the valid stock symbols should be entered.)"),
      
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