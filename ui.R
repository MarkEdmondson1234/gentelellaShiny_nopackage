library(shiny)
library(googleAnalyticsR)
library(dygraphs)
source("top_tiles.R")
source("box_layouts.R")
source("profile.R")
source("progress_bars.R")
source('template.R')

options(shiny.port = 1221)
htmlTemplate("index.html",
             googleLogin = column(width = 12, googleAuthR::googleAuthUI("auth")),
             authDropdown = column(width = 12, googleAnalyticsR::authDropdownUI("auth_dropdown")),
             headerBoilerplate = headerboilerPlate("Shiny HTML Template"),
             sessionTable = graph_box(dataTableOutput("delta")),
             topTiles = tileCountRow(tileCountUI("e1"), tileCountUI("e2"), tileCountUI("e3"),
                                     tileCountUI("e4"), tileCountUI("e5"), tileCountUI("e6")),
             graph_box1 = graph_box(plotOutput("trend_plot"), datepicker = dateRangeInput("datepicker_id", NULL, start = Sys.Date() - 300)),
             another_box = dashboard_box(uiOutput("progress_bar2")),
             another_box2 = dashboard_box(p("Interesting stuff goes here")),
             another_box3 = dashboard_box(p("More interesting stuff")),
             profile = uiOutput("profile"),
             profile_nav = uiOutput("profile_nav"),
             progress_bar = uiOutput("progress_bar")
)
