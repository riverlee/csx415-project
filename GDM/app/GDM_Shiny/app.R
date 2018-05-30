#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
if(!require(GDM.Score)){
  devtools::install_github("riverlee/CSX415-project/GDM/app/pkgs/GDM.Score")
}

if(!require("xgboost")){
  install.packages('xgboost')
}

# Define UI for application that draws a histogram

ui <- fluidPage(
   
   # Application title
   titlePanel("Predict gestational diabetes (GDM)"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("Pregnancies",
                     "Weeks of Pregnancies:",
                     min = 1,
                     max = 50,
                     value = 8),
         
         numericInput('Glucose', 'Glucose level (e.g, 85):', 85,
                      min = 0, max = 500),
         
         numericInput('BloodPressure', 'Blood Pressure (e.g, 80):', 80,
                      min = 0, max = 500),
         
         numericInput('SkinThickness', 'SkinThickness (e.g, 20):', 20,
                      min = 0, max = 500),
         
         numericInput('Insulin', 'Insulin (e.g, 0):', 0,
                      min = 0, max = 2000),
         
         numericInput('BMI', 'BMI (e.g, 28):', 28,
                      min = 0, max = 200),
         
         numericInput('DiabetesPedigreeFunction', 'DiabetesPedigreeFunction (e.g, 0.5):', 0.5,
                      min = 0, max = 10),
         
         numericInput('Age', 'Age (e.g, 30):', 30,
                      min = 0, max = 60),
         
         actionButton("update", "Predict")
         
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h1("Your prediction:"),
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  datasetInput <- eventReactive(input$update, {
   list(
     Pregnancies=input$Pregnancies,
     Glucose= input$Glucose,
     BloodPressure=input$BloodPressure,
     SkinThickness= input$SkinThickness,
     Insulin=input$Insulin,
     BMI=input$BMI,
     DiabetesPedigreeFunction=input$DiabetesPedigreeFunction,
     Age=input$Age
   )
  }, ignoreNULL = FALSE)

   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
     inputs=datasetInput()
      #print(inputs)
      pred<-score(inputs$Pregnancies,inputs$Glucose,inputs$BloodPressure,inputs$
                  SkinThickness,inputs$Insulin,inputs$BMI,inputs$
                  DiabetesPedigreeFunction,inputs$Age)
      
     # print(pred)
      nms=paste(names(pred),"\n(",paste0(sprintf("%.2f",pred*100),"%"),")")
      pie(pred,col=c('green3','red'),radius = 1,labels = nms)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

