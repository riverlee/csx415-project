#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library("caret")

set.seed(1)
n = 100
d = data_frame(
  class = c(rep("true",n),rep("false",n)),
  prob = c(pnorm(rnorm(n)),pnorm(rnorm(n,mean = -1)))
)



# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("An example of walking cutoffs"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Your cutoffs:",
                     min = 0,
                     max = 1,
                     value = 0.5)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        
         plotOutput("distPlot"),
         
         verbatimTextOutput("table")
         
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <-  input$bins
      
      ggplot(d,aes(x = prob,fill=class))+
        geom_histogram(bins = 30,alpha=0.5)+
        geom_vline(xintercept = x,color='grey',linetype=2)
      
      # draw the histogram with the specified number of bins
     
   })
   
   output$table<-renderPrint({
     
     cutoff = input$bins
    
     t=d %>%
       mutate(predicted = ifelse(prob>cutoff,"true","false")) %>%
       select(-prob)  %>%
       mutate_all(funs(factor))
     
     confusionMatrix(t$predicted,t$class)
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

