#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that predicts the next word

shinyUI(navbarPage("Next word prediction model",
                   theme = shinytheme("superhero"),
                   
fluidPage(
  
  # Copy the line below to make a text input box
  fluidRow(column(6,
      textInput("text", label = h3("Type some text here and see the top 3 predicted next words"), 
                value = "Enter text..."),
  
  hr(),
  fluidRow(column(6, 
      verbatimTextOutput("value")))
  
)

)),

## Footer
hr(),


tags$span(style="color:grey", 
          
          tags$footer("@2018-", 
                      tags$a(
                        "Mick Sheahan"), 
                      align = "Left"))

))
