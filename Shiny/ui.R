#   ui.R
#   App Name: wordguess
#   Author: Mick Sheahan
#   Date: 7 Sept 2018
#

library(shiny)
library(shinythemes)



# Define UI for an application to predict suitable next words

shinyUI(
    fluidPage(
        theme = shinytheme("superhero"),
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "wordguess.css")
        ),
        h1("Word Guess"),
        br(),
        h2("A simple predictive text generator"),
        hr(),
        fluidRow(
            column(8, offset = 2,
                   br(), br(),
                   h3("Enter your text to see predicted words"),
                   br(), br()
                   ),
                                
            tags$div(#HTML('<textarea width="100%" id="text" rows="3" cols="30" class="form-control"></textarea>'),
            tags$textarea(id = 'text', placeholder = 'Type something', rows = 3, class='form-control',""),
                                           
            HTML('<script type="text/javascript"> 
                document.getElementById("text").focus();
                </script>'),
                                           
            HTML("<div id='buttons'>"),
                uiOutput("prediction1",inline = T),
                uiOutput("prediction2",inline = T),
                uiOutput("prediction3",inline = T)),
            HTML("</div>"),align="center"),
        
            h5("Click on one of the words above to add it to your text", align = "center"),
                                
            column(3),
        
        ## Footer
            hr(),
            tags$span(style="color:orange", 
            tags$footer("Copyright © R3dCobbler 2018", align = "Left"))
    ))





  
