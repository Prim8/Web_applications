library(shiny)

shinyUI(fluidPage(
    
    # title
    titlePanel("Ozone, Radiation, Temperature, and Wind Relationships"),
    
    sidebarLayout(
        
        sidebarPanel(
            h4("Select a variable:"),
            
            selectInput('xcol', 'X Variable', names(ozone),
                        selected=names(ozone)[[2]]),
            
            selectInput('ycol', 'Y Variable', names(ozone),
                        selected=names(ozone)[[1]]),
            
            br(),
            
            p("Log transformation:"),
            
            checkboxInput("logx", "log(X)", FALSE),
            checkboxInput("logy", "log(Y)", FALSE),
            
            br(),
            
            p("Additional option:"),
            
            checkboxInput("linearfit", "Add linear fit", FALSE),
            
            br(),
            
            h4("Summary:"),
            
            p("This application uses a simple dataset to display the 
            relationship (and the corresponding loess curve) between several 
            variables (ozone, radiation, temperature, and wind)."
              ),
            
            p("Click through the tabs above the scatterplot for optional views."
              ),
            
            br(),
            
            h4("Reference:"),
            
            a("Github", 
                href = "")
        ),
        
        mainPanel(
            h3(textOutput("caption")),
            
            tabsetPanel(type = "tabs",
                        tabPanel("Scatterplot", plotOutput('scatterplot')),
                        tabPanel("Boxplot", plotOutput("boxplot")),
                        tabPanel("Summary Table", verbatimTextOutput("summary"))                        
            )   
        )
    ) 
))