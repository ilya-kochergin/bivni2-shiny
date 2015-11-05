library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 10),selectInput(inputId = "color",label = "Выбор цвета",
                                               selected = "red",
                                               choices = c("red","green","blue")),
  
  plotOutput("graphic")
  
)

server <- function(input, output) {
  output$graphic <- renderPlot({
    curve(sin(input$num*x),from=-pi,to=pi,n=2000,col=input$color)
  })
}

shinyApp(ui = ui, server = server)