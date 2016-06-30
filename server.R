library(shiny)
library(googleAuthR)
library(googleAnalyticsR)
# options(shiny.port = 1221)
source("top_tiles.R")

function(input, output, session){
  
  access_token <- callModule(googleAuthR::googleAuth, "auth", 
                             login_text = "Login")
  
  ga_tables <- reactive({
    validate(
      need(access_token(), "Authenticate")
    )
    with_shiny(google_analytics_account_list,
               shiny_access_token = access_token())
    
  })
  
  selected_id <- callModule(authDropdown, "auth_dropdown", ga_tables)
  
  session_data <- reactive({
    validate(
      need(access_token(), "Authenticate")
    )
    
    s1 <- Sys.Date() - 60
    e1 <- Sys.Date() - 30
    s2 <- Sys.Date() - 29
    e2 <- Sys.Date() - 1
    
    with_shiny(
      google_analytics_4,
      viewId = selected_id(),
      date_range = c(s1, e2, s2, e2),
      metrics = c("sessions","users"),
      dimensions = "medium",
      order = order_type("sessions", "ASCENDING", "DELTA"),
      shiny_access_token = access_token()
    )
    
  })
  
  output$delta <- renderDataTable({
    
    session_data()
    
  })
  
  ## top tiles
  shiny::callModule(updateTileCount, "e1",
                    value = session_data()[2,"sessions.d1"],
                    change_value = session_data()[2,"sessions.d1"] - session_data()[2,"sessions.d2"],
                    going_well = if(session_data()[2,"sessions.d1"] - session_data()[2,"sessions.d2"] > 0) TRUE else FALSE,
                    tile_title = " Organic Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e2",
                    value = session_data()[1,"sessions.d1"],
                    change_value = session_data()[1,"sessions.d1"] - session_data()[1,"sessions.d2"],
                    going_well = if(session_data()[1,"sessions.d1"] - session_data()[1,"sessions.d2"] > 0) TRUE else FALSE,
                    tile_title = " Direct Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e3",
                    value = session_data()[3,"sessions.d1"],
                    change_value = session_data()[3,"sessions.d1"] - session_data()[3,"sessions.d2"],
                    going_well = if(session_data()[3,"sessions.d1"] - session_data()[3,"sessions.d2"] > 0) TRUE else FALSE,
                    tile_title = " Referral Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
}