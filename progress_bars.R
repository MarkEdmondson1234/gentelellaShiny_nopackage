#' Vertical stacked progress bars
#' 
#' Progress bars are scaled from 0 to 100
#' 
#' @param values A named vector of values
#' @param display_totals A named vector same length as values showing totals
#' @param small If there should be small bars or big bars
#' @param bar_class The class of the bars themselves
#' 
#' @return a stack of progress bars
progress_stack <- function(values,
                           display_totals = NULL,
                           small = TRUE,
                           text_pos = c("top","side"),
                           bar_class = "progress-bar bg-green"){
  text_pos <- match.arg(text_pos) 
  
  if(small){
    prog_class = "progress progress_sm"
  } else {
    prog_class = "progress"
  }
 
  make_progress_top <- function(x){
    val <- values[[x]]
    name <- x
    withTags({
    div(class = "col-md-12 col-sm-12 col-xs-6",
        div(
          p(paste(name, display_totals[[x]])),
          div(class = prog_class, style="width: 76%;",
              div(class=bar_class, role="progressbar", `data-transitiongoal`=val)
              )
          )
        )
    })
  }
  
  make_progress_side <- function(x){
    val <- values[[x]]
    name <- x
    withTags({
      div(class = "widget_summary",
          div(class = "w_left w_25",
              span(name)
          ),
          div(class = "w_center w_55",
              div(class="progress",
                  div(class=bar_class, role = "progressbar", `data-transitiongoal`=val, style="width: 25%;",
                      span(class = "sr-only", paste0(val, "% Complete"))
                  )
              )
          ),
          div(class = "w_right w_20",
              span(display_totals[[x]])
          ),
          div(class = "clearfix")
      )
    })
  }
  
  switch(text_pos,
         top = lapply(names(values), make_progress_top),
         side = lapply(names(values), make_progress_side)
         )
  
}
  

# <div class="widget_summary">
#   <div class="w_left w_25">
#     <span>0.1.5.4</span>
#   </div>
#     <div class="w_center w_55">
#       <div class="progress">
#         <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
#           <span class="sr-only">60% Complete</span>
#             </div>
#             </div>
#             </div>
#             <div class="w_right w_20">
#               <span>23k</span>
#               </div>
#               <div class="clearfix"></div>
#                 </div>
                
  # <div class="col-md-12 col-sm-12 col-xs-6">
  #   <div>
  #   <p>Facebook Campaign</p>
  #   <div class="">
  #     <div class="progress progress_sm" style="width: 76%;">
  #       <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
  #         </div>
  #         </div>
  #         </div>
  #         <div>
  #         <p>Twitter Campaign</p>
  #         <div class="">
  #           <div class="progress progress_sm" style="width: 76%;">
  #             <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
  #               </div>
  #               </div>
  #               </div>
  #               </div>
  #               <div class="col-md-12 col-sm-12 col-xs-6">
  #                 <div>
  #                 <p>Conventional Media</p>
  #                 <div class="">
  #                   <div class="progress progress_sm" style="width: 76%;">
  #                     <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
  #                       </div>
  #                       </div>
  #                       </div>
  #                       <div>
  #                       <p>Bill boards</p>
  #                       <div class="">
  #                         <div class="progress progress_sm" style="width: 76%;">
  #                           <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
  #                             </div>
  #                             </div>
  #                             </div>
  #                             </div>