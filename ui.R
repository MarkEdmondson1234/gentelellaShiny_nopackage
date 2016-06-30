library(shiny)
library(googleAnalyticsR)
source("top_tiles.R")
source("box_layouts.R")

options(shiny.port = 1221)
htmlTemplate("index.html",
             googleLogin = googleAuthR::googleAuthUI("auth"),
             authDropdown = googleAnalyticsR::authDropdownUI("auth_dropdown"),
             sessionTable = dataTableOutput("delta"),
             # topTiles = tileCountRow(tileCountElement(), tileCountElement(), tileCountElement()),
             topTiles = tileCountRow(tileCountUI("e1"), tileCountUI("e2"), tileCountUI("e3"),
                                     tileCountUI("e4"), tileCountUI("e5"), tileCountUI("e6")),
             graph_box = graph_box(),
             another_box = dashboard_box(p("Hello from the box"))
)