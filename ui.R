library(shiny)
library(googleAnalyticsR)

htmlTemplate("index.html",
             googleLogin = googleAuthR::googleAuthUI("auth"),
             authDropdown = googleAnalyticsR::authDropdownUI("auth_dropdown"),
             button = actionButton("action", "Action"),
             slider = sliderInput("x", "X", 1, 100, 50)
)