#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

vinos <- read.csv("vinos.csv")
modelo <- lm(quality ~ . -quality, vinos)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Wine Quality Prediction:"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("alcohol", "Alcohol:", min = 0, max = 30, value = 20),
            sliderInput("fixed.acidity", "Fixed Acidity:", min = 1, max = 10, value = 5),
            sliderInput("volatile.acidity", "Volatile Acidity:", min = 0, max = 1, value = 0.1),
            sliderInput("citric.acid", "Citric Acid:", min = 0, max = 1, value = 0.1),
            sliderInput("residual.sugar", "Residual Sugar:", min = 0, max = 40, value = 20),
            sliderInput("chlorides", "Chlorides:", min = 0, max = 1, value = 0.4),
            sliderInput("free.sulfur.dioxide", "Free Sulfur Dioxide:", min = 0, max = 100, value = 45),
            sliderInput("total.sulfur.dioxide", "Total Sulfur Dioxide:", min = 1, max = 300, value = 170),
            sliderInput("density", "Density:", min = 0.99, max = 1, value = 1.0),
            sliderInput("pH", "PH:", min = 1, max = 14, value = 3),
            sliderInput("sulphates", "Sulphates:", min = 0, max = 1, value = 0.45)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            span(textOutput("quality"), style = "font-size: 100px; color: steelblue;")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$quality <- renderText({
        nuevo <- data.frame(
            fixed.acidity = input$fixed.acidity,
            volatile.acidity = input$volatile.acidity,
            citric.acid = input$citric.acid,
            residual.sugar = input$residual.sugar,
            chlorides = input$chlorides,
            free.sulfur.dioxide = input$free.sulfur.dioxide,
            total.sulfur.dioxide = input$total.sulfur.dioxide,
            density = input$density,
            pH = input$pH,
            sulphates = input$sulphates,
            alcohol = input$alcohol
        )
        
        predict(modelo, nuevo)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
