#' tileCountRow
#'
#' @param ... tileCountElements
#'
#' @return Tile Count
tileCountRow <- function(...){

  tags$div(class = "row tile_count",
        tagList(...)
        )

}

#' tileCountRow Element
#' 
#' @param value Count value
#' @param change_value Change value
#' @param going_well If TRUE then change_value is green, else red
#' @param tile_title Title text
#' @param width Width of tile in bootstrap
#' @param icon_in Icon to show
#' @param from_text Change text
#' @param highlight color to highlight value
#' 
#' @return a tileCountRow for use within \link{tileCountRow}
tileCountElement <- function(value = 2500,
                             change_value = "4%",
                             going_well = TRUE,
                             tile_title = " Total Users",
                             width = 2,
                             icon_in = icon("user"),
                             from_text = " From last Week",
                             highlight = ""){
  if(going_well){
    bottom_icon <- tags$i(class = "green", icon("sort-asc"), change_value)
  } else {
    bottom_icon <- tags$i(class = "red", icon("sort-desc"), change_value)
  }
  
  withTags({
    div(class = paste0("col-md-",width," col-sm-4 col-xs-6 tile_stats_count"),
        span(class = "count_top", icon_in, tile_title),
        div(class = paste("count", highlight), value),
        span(class = "count_bottom", bottom_icon, from_text)
        )
    
  })
  
}

#' tileCount UI
#'
#' Shiny Module for use with \link{tileCount}
#' 
#' @param id Shiny id
#'
#' @return Shiny UI
tileCountUI <- function(id){

  ns <- shiny::NS(id)
  
  uiOutput(ns("tile_count"))

}

#' updateTileCount
#'
#' Shiny Module for use with \link{tileCountUI}
#'
#' Call via \code{shiny::callModule(updateTileCount, "your_id")}
#'
#' @param input shiny input
#' @param output shiny output
#' @param session shiny session
#' @param value Count value
#' @param change_value Change value
#' @param going_well If TRUE then change_value is green, else red
#' @param tile_title Title text
#' @param width Width of tile in bootstrap
#' @param icon_in Icon to show
#' @param from_text Change text
#' @param highlight color to highlight value
#' 
#' @return NULL
updateTileCount <- function(input, output, session,
                            value,
                            change_value,
                            going_well,
                            tile_title = " Total Users",
                            width = 2,
                            icon_in = icon("user"),
                            from_text = " From last Week",
                            highlight = ""){

    ns <- session$ns
    
    output$tile_count <- renderUI({
      
      tileCountElement(value = value(),
                       change_value = change_value(),
                       going_well = going_well(),
                       tile_title = tile_title,
                       width = width,
                       icon_in = icon_in,
                       from_text = from_text,
                       highlight = highlight)
      
    })

}



# <!-- top tiles -->
#   <div class="row tile_count">
#     <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#       <span class="count_top"><i class="fa fa-user"></i> Total Users</span>
#         <div class="count">2500</div>
#           <span class="count_bottom"><i class="green">4% </i> From last Week</span>
#             </div>
#             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#               <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
#                 <div class="count">123.50</div>
#                   <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
#                     </div>
#                     <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#                       <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
#                         <div class="count green">2,500</div>
#                           <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
#                             </div>
#                             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#                               <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
#                                 <div class="count">4,567</div>
#                                   <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
#                                     </div>
#                                     <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#                                       <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
#                                         <div class="count">2,315</div>
#                                           <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
#                                             </div>
#                                             <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
#                                               <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
#                                                 <div class="count">7,325</div>
#                                                   <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
#                                                     </div>
#                                                     </div>
#                                                     <!-- /top tiles -->