library(shiny)
library(googleAnalyticsR)
source("top_tiles.R")
source("box_layouts.R")
source("profile.R")
source("progress_bars.R")

options(shiny.port = 1221)
htmlTemplate("index.html",
             googleLogin = googleAuthR::googleAuthUI("auth"),
             authDropdown = dashboard_box(googleAnalyticsR::authDropdownUI("auth_dropdown"), 
                                          width = 12, box_title = "Account Picker"),
             sessionTable = graph_box(dataTableOutput("delta")),
             topTiles = tileCountRow(tileCountUI("e1"), tileCountUI("e2"), tileCountUI("e3"),
                                     tileCountUI("e4"), tileCountUI("e5"), tileCountUI("e6")),
             graph_box = graph_box(),
             another_box = dashboard_box(uiOutput("progress_bar2")),
             another_box2 = dashboard_box(p("Interesting stuff goes here")),
             another_box3 = dashboard_box(p("More interesting stuff")),
             profile = uiOutput("profile"),
             profile_nav = uiOutput("profile_nav"),
             progress_bar = uiOutput("progress_bar")
)