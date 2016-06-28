library(shiny)

htmlTemplate("index.html",
             button = actionButton("action", "Action"),
             slider = sliderInput("x", "X", 1, 100, 50)
)