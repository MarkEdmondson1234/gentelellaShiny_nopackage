library(shiny)
library(googleAnalyticsR)
options(shiny.port = 1221)
htmlTemplate("index.html",
             googleLogin = googleAuthR::googleAuthUI("auth"),
             authDropdown = googleAnalyticsR::authDropdownUI("auth_dropdown"),
             sessionTable = dataTableOutput("delta")
)