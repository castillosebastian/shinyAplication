library(shiny)
# Definir UI
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict diamond's price"),
  
  sidebarLayout(
    sidebarPanel(
        helpText("This app predicts a diamond's price based on specific characteristics"),
        h3(helpText("Select:")),
       numericInput("car", label = h4("Carats"), step = 0.01, value = 2),
       selectInput("cut", label = h4("Cut"), 
                   choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                  "Very Good" = "Very Good", "Premium" = "Premium",
                                  "Ideal" = "Ideal")),
       selectInput("col", label = h4("Color"), 
                   choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                  "F" = "F", "G" ="G",
                                  "H" = "H", "I" = "I",
                                  "J" = "J")),
       selectInput("clar", label = h4("Clarity"), 
                   choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                  "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                  "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" ))
    ),
    
    # Show a plot 
    mainPanel(
       plotOutput("distPlot"),
       h4("Predicted value:"),
       h3(textOutput("result"))
    )
  )
))
