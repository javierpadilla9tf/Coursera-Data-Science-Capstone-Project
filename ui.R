library(shiny)
library(shinythemes)
library(wordcloud)


shinyUI(navbarPage("Coursera Datascience Capstone: Next word prediction model",
                   theme = shinytheme("cosmo"),
                   
                   
                   
                   tabPanel(HTML("Application</a></li><li><a href=\'https://github.com/javierpadilla9tf/Coursera-Data-Science-Capstone-Project'>Github</a></li>"),
                            
                            fluidRow(
                              column(3),
                              column(6,
                                     tags$head(
                                       tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                                     ),
                                     tags$div(
                                       #HTML('<textarea width="60%" id="text" rows="3" cols="30" class="form-control"></textarea>'),
                                       h3("Enter your text here"),
                                       tags$textarea(id = 'text', placeholder = 'Type here', rows = 3, class='form-control',""),
                                       
                                       
                                       HTML('<script type="text/javascript"> 
                                            document.getElementById("text").focus();
                                            </script>'),
                                       
                                       HTML("<div id='buttons'>"),
                                       uiOutput("prediction1",inline = T),
                                       uiOutput("prediction2",inline = T),
                                       uiOutput("prediction3",inline = T)),
                                     HTML("</div>"),align="center"),
                              
                              
                              column(3)
                              )),
                   
                   
                   hr(),
                   
                   
                   tags$span(style="color:blue", 
                             
                             tags$footer("2017-", 
                                         tags$a(
                                           target="_blank",
                                           "Javier Padilla Jr"), 
                                         align = "Center"))
                   
                   ))
