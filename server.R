library(shiny)
library(googleAuthR)
library(googleAnalyticsR)
# options(shiny.port = 1221)

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
  
}