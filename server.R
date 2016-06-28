library(shiny)
library(googleAuthR)
library(googleAnalyticsR)
options(shiny.port = 1221)

function(input, output, session){
  
  access_token <- callModule(googleAuthR::googleAuth, "auth")
  
  ga_tables <- reactive({
    validate(
      need(access_token(), "Authenticate")
    )
    with_shiny(google_analytics_account_list,
               shiny_access_token = access_token())
    
  })
  
  selected_id <- callModule(authDropdown, "auth_dropdown", ga_tables)
  
}