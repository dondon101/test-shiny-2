library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("period", "Period", 
                 min = 0.5, max = 2, value = 1, step = 0.5),
      sliderInput("amplitude", "Amplitude", 
                 min = 0, max = 2, value = 1, step = 0.25),
      sliderInput("shift", "Phase shift", 
                 min = 0, max = 2, value = 0, step = 0.1)
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    t <- seq(0, 4, by = 0.01)
    s <- input$amplitude * sin((2 * pi / input$period) * (t - input$shift / 2))
    
    plot(t, s, type = "l", ylim = c(-2, 2),
         xlab = "Time", ylab = "Sine wave",
         main = "Sine Function Visualization")
    grid()
  })
}

shinyApp(ui, server)
