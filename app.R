# Load necessary libraries
library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Interactive Dashboard"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      # Input: Select a variable for the plot
      selectInput(inputId = "variable",
                  label = "Choose a variable:",
                  choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                  selected = "Sepal.Length")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      # Output: Plot
      plotOutput(outputId = "plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression to create the plot based on user input
  output$plot <- renderPlot({
    # Create a scatterplot
    ggplot(iris, aes_string(x = input$variable, y = "Sepal.Width")) +
      geom_point() +
      labs(x = input$variable, y = "Sepal Width")
  })
}

# Run the application
shinyApp(ui = ui, server = server)

