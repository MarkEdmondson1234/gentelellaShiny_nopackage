#' Graph box
#' 
#' A box for graphs
#' 
#' @param width width of box
#' @param boxtitle Title of box
#' @param subtitle Sub-title of box
#' @param datepicker a dateRangeInput or similar
#' @param ... Other elements to appear in the box such as graphs.
#' 
#' @return a box with a datepicker to put plots in
graph_box <- function(...,
                      width = 12,
                      boxtitle = "Impressive Title",
                      subtitle = "sub-title",
                      datepicker = dateRangeInput("datepicker_id", NULL)
                      ){
  
  withTags({
    div(class = paste(c("col-md","col-sm","col-xs"), width, sep = "-", collapse = " "),
        div(class = "dashboard_graph",
            div(class = "row x_title",
                div(class = "col-md-6",
                    h3(boxtitle,
                       small(subtitle)
                       )
                    ),
                div(class = "col-md-6",
                    div(id="reportrange", class = "", style="padding: 10px 5px 1px",
                        datepicker)  
                        )
                ),
            tagList(...),
            div(class="clearfix")
            )
        )
    
  })
}

#' A box to put dashboard elements in
#' 
#' Its 320 pixels high
#' 
#' @param ... elements to put in the box
#' @param width Width
#' @param box_title Title above
#' @param menuItems A list of other things to appear in top menu
#' 
#' @return A box to put elements in
dashboard_box <- function(..., 
                          width=4,
                          height=320,
                          box_title = "Box title",
                          menuItems = list(a(class = "collapse-link", icon("chevron-up")), a(href="#", "One"), a(href="#", "Two"))){
  
  withTags({
    div(class = paste0(paste(c("col-md","col-sm"), width, sep = "-", collapse = " "), " col-xs-12"),
      div(class = "x_panel tile", style = paste0("height: ", height, "px;"),
          div(class = "x_title",
              h2(box_title),
              ul(class = "nav navbar-right panel_toolbox",
                 ## add more items to li menu if passed.
                 tagList(lapply(menuItems, li))
                 ),
              div(class="clearfix")
              ),
          div(class = "x_content",
              tagList(...)
              )
          )   
    )
    
    
  })
}
  
  # <div class="col-md-4 col-sm-4 col-xs-12">
  #   <div class="x_panel tile fixed_height_320">
  #     <div class="x_title">
  #       <h2>App Versions</h2>
  #       <ul class="nav navbar-right panel_toolbox">
  #         <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
  #         <li class="dropdown">
  #           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
  #           <ul class="dropdown-menu" role="menu">
  #             <li><a href="#">Settings 1</a></li>
  #             <li><a href="#">Settings 2</a></li>
  #           </ul>
  #         </li>
  #         <li><a class="close-link"><i class="fa fa-close"></i></a></li>
  #        </ul>
  #        <div class="clearfix"></div>
  #      </div>
  #  <div class="x_content"></div>

#   <div class="col-md-12 col-sm-12 col-xs-12">
#     <div class="dashboard_graph">
#       <div class="row x_title">
#         <div class="col-md-6">
#           <h3>Network Activities <small>Graph title sub-title</small></h3>
#         </div>
#         <div class="col-md-6">
#             <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
#               <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
#                 <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
#               </div>
#           </div>
#         </div>
#         <div class="col-md-9 col-sm-9 col-xs-12">
#            <div id="placeholder33" style="height: 260px; display: none" class="demo-placeholder"></div>
#            <div style="width: 100%;">
#              <div id="canvas_dahs" class="demo-placeholder" style="width: 100%; height:270px;"></div>
#            </div>
#         </div>


#         <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
#             <div class="x_title">
#              <h2>Top Campaign Performance</h2>
#              <div class="clearfix"></div>
#             </div>
#                                 
#            <div class="col-md-12 col-sm-12 col-xs-6">
#              <div>
#              <p>Facebook Campaign</p>
#                <div class="">
#                  <div class="progress progress_sm" style="width: 76%;">
#                       <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
#                  </div>
#                 </div>
#              </div>
#           
#              <div>
#                <p>Twitter Campaign</p>
#                 <div class="">
#                   <div class="progress progress_sm" style="width: 76%;">
#                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
#                   </div>
#                  </div>
#                 </div>
#               </div>

#               <div class="col-md-12 col-sm-12 col-xs-6">
#                 <div>
#                   <p>Conventional Media</p>
#                       <div class="">
#                          <div class="progress progress_sm" style="width: 76%;">
#                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
#                           </div>
#                        </div>
#                   </div>
#                <div>
#                 <p>Bill boards</p>
#                   <div class="">
#                       <div class="progress progress_sm" style="width: 76%;">
#                           <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
#                       </div>
#                    </div>
#                </div>

#          </div>
#                                                             
#        </div>
#                                                             
#       <div class="clearfix"></div>
#       </div>
#    </div>
#                                                               
#  </div>
#  <br />



# <div class="row">
# {{ sessionTable }}
# <div class="col-md-12 col-sm-12 col-xs-12">
#   <div class="dashboard_graph">
#     <div class="row x_title">
#       <div class="col-md-6">
#         <h3>Network Activities <small>Graph title sub-title</small></h3>
#         </div>
#         <div class="col-md-6">
#           <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
#             <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
#               <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
#                 </div>
#                 </div>
#                 </div>
#                 
#                 <div class="col-md-9 col-sm-9 col-xs-12">
#                   <div id="placeholder33" style="height: 260px; display: none" class="demo-placeholder"></div>
#                     <div style="width: 100%;">
#                       <div id="canvas_dahs" class="demo-placeholder" style="width: 100%; height:270px;"></div>
#                         </div>
#                         </div>
#                         <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
#                           <div class="x_title">
#                             <h2>Top Campaign Performance</h2>
#                             <div class="clearfix"></div>
#                               </div>
#                               
#                               <div class="col-md-12 col-sm-12 col-xs-6">
#                                 <div>
#                                 <p>Facebook Campaign</p>
#                                 <div class="">
#                                   <div class="progress progress_sm" style="width: 76%;">
#                                     <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
#                                       </div>
#                                       </div>
#                                       </div>
#                                       <div>
#                                       <p>Twitter Campaign</p>
#                                       <div class="">
#                                         <div class="progress progress_sm" style="width: 76%;">
#                                           <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
#                                             </div>
#                                             </div>
#                                             </div>
#                                             </div>
#                                             <div class="col-md-12 col-sm-12 col-xs-6">
#                                               <div>
#                                               <p>Conventional Media</p>
#                                               <div class="">
#                                                 <div class="progress progress_sm" style="width: 76%;">
#                                                   <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
#                                                     </div>
#                                                     </div>
#                                                     </div>
#                                                     <div>
#                                                     <p>Bill boards</p>
#                                                     <div class="">
#                                                       <div class="progress progress_sm" style="width: 76%;">
#                                                         <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
#                                                           </div>
#                                                           </div>
#                                                           </div>
#                                                           </div>
#                                                           
#                                                           </div>
#                                                           
#                                                           <div class="clearfix"></div>
#                                                             </div>
#                                                             </div>
#                                                             
#                                                             </div>
#                                                             <br />




##### boxes
# <div class="col-md-4 col-sm-4 col-xs-12">
#   <div class="x_panel tile fixed_height_320">
#     <div class="x_title">
#       <h2>App Versions</h2>
#       <ul class="nav navbar-right panel_toolbox">
#         <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
#           </li>
#           <li class="dropdown">
#             <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
#               <ul class="dropdown-menu" role="menu">
#                 <li><a href="#">Settings 1</a>
#                   </li>
#                   <li><a href="#">Settings 2</a>
#                     </li>
#                     </ul>
#                     </li>
#                     <li><a class="close-link"><i class="fa fa-close"></i></a>
#                       </li>
#                       </ul>
#                       <div class="clearfix"></div>
#                         </div>
#                         <div class="x_content">
#                           
#                                                                                                           </div>