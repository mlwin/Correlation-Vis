# server.R

library(shiny)
library(quantmod)
library(ggplot2) 

shinyServer(function(input, output) {
  
  # create symbol cache
  symbol_env <- new.env()

  stock1 <- function(envir = parent.frame()) {
        if (is.null(envir[[input$symb1]])) {
          envir[[input$symb1]] <- as.numeric(Delt(getSymbols(input$symb1, src = "yahoo", 
                                  from = input$dates[1],
                                  to = input$dates[2],
                                  auto.assign = FALSE)[,4]))*100
        }
        
        envir[[input$symb1]]
  }
  
  stock2 <- function(envir = parent.frame()) {
    if (is.null(envir[[input$symb2]])) {
    envir[[input$symb2]] <- as.numeric(Delt(getSymbols(input$symb2, src = "yahoo", 
                               from = input$dates[1],
                               to = input$dates[2],
                               auto.assign = FALSE)[,4]))*100
    }
    
    envir[[input$symb2]]
    
  }

  output$plot <- renderPlot({

    qplot(stock1(symbol_env), stock2(symbol_env), geom=c("point", "smooth"), method=lm, formula=y~x, xlab=input$symb1, ylab=input$symb2)
  })
  

  output$text1 <- renderText({ 
    
    d1 = stock1(symbol_env)
    d2 = stock2(symbol_env)

    d1[1] = 0
    d2[1] = 0
    paste("The correlation between two stocks is ", round(cor(d1,d2), 3))
          
  })

})