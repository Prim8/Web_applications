# server.R
library(shiny)
library(quantmod)

shinyServer(function(input, output) {
    
    # Fetch data from Yahoo Finance
    dataInput <- reactive({  
        getSymbols(input$stockSymbol, src = 'yahoo', 
                   from = input$dateRange[1], 
                   to = input$dateRange[2],
                   auto.assign = FALSE)
        
    })
    
    # Plot output (daily closing values)
    output$plot <- renderPlot(
        chartSeries(dataInput(), 
                    type = "line"
                    )
    )

})