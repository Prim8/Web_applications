library(shiny)
library(ggplot2)
library(ElemStatLearn) # data(ozone)

shinyServer(function(input, output, session) {
    
    # Compute the formula text in a reactive expression since it is 
    # shared by the output$xcol and output$ycol functions
    formulaText <- reactive({
        paste(input$ycol, "versus", input$xcol)
    })
    
    # Return the formula text for printing as a caption
    output$caption <- renderText({
        formulaText()
    })
    
    # Compute the ozone data in a reactive expression
    # and combine the selected variables into a new data frame
    selectedData <- reactive({
        ozone[, c(input$xcol, input$ycol)]
    })
    
    # Scatterplot
    output$scatterplot <- renderPlot({
        
        # Option for log transformation
        if (input$logx==TRUE & input$logy==TRUE){
            p <- ggplot(selectedData(),
                        aes_string(x=input$xcol, y=input$ycol)) +
                scale_x_log10() +
                scale_y_log10() 
            
        } else if (input$logx==TRUE){
            p <- ggplot(selectedData(),
                        aes_string(x=input$xcol, y=input$ycol)) +
                scale_x_log10() 
            
        } else if (input$logy==TRUE){
            p <- ggplot(selectedData(),
                        aes_string(x=input$xcol, y=input$ycol)) +
                scale_y_log10() 
            
        } else {
            p <- ggplot(selectedData(),
                        aes_string(x=input$xcol, y=input$ycol))
        }
        
        # Option for adding a linear fit
        if (input$linearfit==TRUE){
            p <- p +
                geom_smooth(method=lm, se=FALSE, size=1, colour="black")
        }
        
        # plot
        p <- p +
            geom_point(colour = "red", size = 4) +
            geom_smooth(size=1) +
            theme(axis.text = element_text(size = rel(1.2))) +
            theme(axis.title.x = element_text(size = rel(1.5))) +
            theme(axis.title.y = element_text(size = rel(1.5)))
        
        print(p)
        
    })
    
    # Boxplot
    output$boxplot <- renderPlot({
        boxplot(ozone)
    })
    
    # Summary table
    output$summary <- renderPrint({
        summary(ozone)
    })
    
})

