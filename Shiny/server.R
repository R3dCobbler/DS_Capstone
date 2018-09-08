 #   server.R
#   App Name: WordGuess
#   Author: Mick Sheahan
#   Date: 7 Sept 2018
#

library(shiny)
library(shinythemes)

source("global.R")

# Define server logic required to generate next word prediction

shinyServer(function(input, output, session) {
    
    observe({
        text <- reactive({input$text})
        
        Prediction <- head(unique(predictNextWord(input$text)$word), 3)
        a1 <<- Prediction[1]
        a2 <<- Prediction[2]
        a3 <<- Prediction[3]
        
        output$prediction1 <- renderUI({
            actionButton("button1", label = a1)
            #HTML("<button id="prediction1" class="shiny-text-output"></button>")
        })
        
        output$prediction2 <- renderUI({
            actionButton("button2", label = a2)
        })
        
        output$prediction3 <- renderUI({
            actionButton("button3", label = a3)
        })
        
    })
    
    
    observeEvent(input$button1, {
        if(input$button1 == 1){
            name <- paste(input$text, a1)
            updateTextInput(session, "text", value=name)
        }
    })
    
    observeEvent(input$button2, {
        name <- paste(input$text, a2)
        updateTextInput(session, "text", value=name)
    })
    
    observeEvent(input$button3, {
        name <- paste(input$text, a3)
        updateTextInput(session, "text", value=name)
    })
    
})



