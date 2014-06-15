library(shiny)

shinyUI(fluidPage(
    
    # Title of the app
    titlePanel("Stock Market Time Series"),
    
    sidebarLayout(
        
        sidebarPanel(
        
            h4("Summary:"),
            
            p("This application fetches data from",
              a("Yahoo Finance", 
                href = "https://finance.yahoo.com/",
                target = "_blank"), 
              "and returns the stock market data given the company stock
              symbol and the date range specified by the user."
            ),
            
            br(),
            
            h4("Enter a stock symbol:"),
            
            p("e.g. 'GOOG', 'AMZN', or look up",
                a("companies names:",
              href = "http://www.nasdaq.com/screening/companies-by-name.aspx?letter=A",
              target = "_blank")
              ),
            
            textInput("stockSymbol", "", "YHOO"),
            
            br(),
            
            h4("Date range:"),
    
            dateRangeInput("dateRange", 
                           "", 
                           start = "2014-01-01", 
                           end = as.character(Sys.Date())
                           ),

            br(),
            br(),
            
            h4("Reference:"),
    
            a("Github", 
              href = "https://github.com/Prim8/Web_applications/tree/master/Finance",
              target = "_blank")
    
        ),
    
    mainPanel(plotOutput("plot"))
    
    )
))