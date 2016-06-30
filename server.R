library(shiny)
library(googleAuthR)
library(googleAnalyticsR)
# options(shiny.port = 1221)
source("top_tiles.R")
source("box_layouts.R")

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
  
  top_tile_data <- reactive({
    
    sd <- session_data()
    
    list(
      e1.value = sd[sd$medium == "(none)","sessions.d1"],
      e1.change_value = sd[sd$medium == "(none)","sessions.d1"] - sd[sd$medium == "(none)","sessions.d2"],
      e1.going_well = if(sd[sd$medium == "(none)","sessions.d1"] - sd[sd$medium == "(none)","sessions.d2"] > 0) TRUE else FALSE,
      e2.value = sd[sd$medium == "referral","sessions.d1"],
      e2.change_value = sd[sd$medium == "referral","sessions.d1"] - sd[sd$medium == "referral","sessions.d2"],
      e2.going_well = if(sd[sd$medium == "referral","sessions.d1"] - sd[sd$medium == "referral","sessions.d2"] > 0) TRUE else FALSE,
      e3.value = sd[sd$medium == "organic","sessions.d1"],
      e3.change_value = sd[sd$medium == "organic","sessions.d1"] - sd[sd$medium == "organic","sessions.d2"],
      e3.going_well = if(sd[sd$medium == "organic","sessions.d1"] - sd[sd$medium == "organic","sessions.d2"] > 0) TRUE else FALSE
    )
  })
  
  ## top tiles
  shiny::callModule(updateTileCount, "e1",
                    value = reactive(top_tile_data()$e1.value),
                    change_value = reactive(top_tile_data()$e1.change_value),
                    going_well = reactive(top_tile_data()$e1.going_well),
                    tile_title = " Direct Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e2",
                    value = reactive(top_tile_data()$e2.value),
                    change_value = reactive(top_tile_data()$e2.change_value),
                    going_well = reactive(top_tile_data()$e2.going_well),
                    tile_title = " Referral Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e3",
                    value = reactive(top_tile_data()$e3.value),
                    change_value = reactive(top_tile_data()$e3.change_value),
                    going_well = reactive(top_tile_data()$e3.going_well),
                    tile_title = " Organic Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week",
                    highlight = "green")
  
  shiny::callModule(updateTileCount, "e4",
                    value = reactive(top_tile_data()$e1.value),
                    change_value = reactive(top_tile_data()$e1.change_value),
                    going_well = reactive(top_tile_data()$e1.going_well),
                    tile_title = " Direct Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e5",
                    value = reactive(top_tile_data()$e2.value),
                    change_value = reactive(top_tile_data()$e2.change_value),
                    going_well = reactive(top_tile_data()$e2.going_well),
                    tile_title = " Referral Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
  shiny::callModule(updateTileCount, "e6",
                    value = reactive(top_tile_data()$e3.value),
                    change_value = reactive(top_tile_data()$e3.change_value),
                    going_well = reactive(top_tile_data()$e3.going_well),
                    tile_title = " Organic Sessions",
                    width = 2,
                    icon_in = icon("user"),
                    from_text = " From last Week")
  
}