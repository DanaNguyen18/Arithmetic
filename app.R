
library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1",
                   label = "Number 1",
                   value = 0),
      numericInput(inputId = "number2",
                   label = "Number 2",
                   value = 0),
      actionButton(inputId = "button1",
                   label = "Add"),
      actionButton(inputId = "button2",
                   label = "Multiply")
      
    ),
    mainPanel(
      h2("The sum of the two numbers is:"),
      textOutput("sum"),
      h2("The product of the two numbers is:"),
      textOutput("multiply")
    )
  )
)

server <- function(input, output) {
  m <- eventReactive(input$button1, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    x1 + x2
  })
  s <- eventReactive(input$button2, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    x1 * x2
  })
  output$sum <- renderText({
    m()
  })
  output$multiply <- renderText({
    s()
  })
}

shinyApp(ui = ui, server = server)

