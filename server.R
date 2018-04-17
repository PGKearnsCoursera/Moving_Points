#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  nplot = eventReactive(input$plotbutton,{
    if(!exists("pointframe")){
      pointframe = data.frame(x=input$xvalue,y = input$yvalue)
      }
    else{
      pointframe = rbind(pointframe,c(input$xvalue,input$yvalue))
      }
    plot(pointframe,pch = input$plotchar)
    
  }) 
  
  output$distPlot <- renderPlot({
    nplot()
    
    
    

  })
  

  
})
