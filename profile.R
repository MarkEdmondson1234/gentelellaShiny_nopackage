#' Render the profile box
#' 
#' @param profile_name The user name
#' @param profile_url The user profile image url
#' 
#' @return profile box
profile_box <- function(profile_name,
                        profile_url){
  
  withTags({
    
    div(class = "profile",
        div(class = "profile_pic",
            img(src = profile_url, class="img-circle profile_img")
            ),
        div(class = "profile_info",
            span("Welcome,"),
            h2(profile_name)
            )
        )
  })
  # <!-- menu profile quick info -->
  #   <div class="profile">
  #     <div class="profile_pic">
  #       <img src={{ profile_image_url }} alt="..." class="img-circle profile_img">
  #     </div>
  #     <div class="profile_info">
  #       <span>Welcome,</span>
  #       <h2>John Doe</h2>
  #     </div>
  #   </div>
  #   <!-- /menu profile quick info -->
}


#' Render the top navbar profile
#' 
#' @param profile_name The user name
#' @param profile_url The user profile image url
#' 
#' @return profile top nav
profile_nav <- function(profile_name,
                        profile_url,
                        menu_items = list(tags$li(
                                           tags$a(href="javascript:;", " Profile")
                                           ),
                                          tags$li(
                                            tags$a(href="javascript:;", " Settings")
                                          ),
                                          tags$li(
                                            tags$a(href="javascript:;", "Help")
                                          ),
                                          tags$li(
                                            tags$a(href="#", tags$i(class="fa fa-sign-out pull-right"), "Log out"
                                            )))
                        ){
  
  withTags(
    ul(class = "nav navbar-nav navbar-right",
       li(
         a(href="javascript:;", class="user-profile dropdown-toggle", `data-toggle`="dropdown", `aria-expanded`="false",
           img(src=profile_url),profile_name,
           span(class=" fa fa-angle-down")
           ),
         ul(class="dropdown-menu dropdown-usermenu pull-right",
            tagList(menu_items)
         )
       ))
    
    
  )
  
  # <ul class="nav navbar-nav navbar-right">
  #   <li class="">
  #     <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
  #       <img src="images/img.jpg" alt="">John Doe
  #       <span class=" fa fa-angle-down"></span>
  #         </a>
  #         <ul class="dropdown-menu dropdown-usermenu pull-right">
  #           <li><a href="javascript:;"> Profile</a></li>
  #             <li>
  #             <a href="javascript:;">
  #               <span class="badge bg-red pull-right">50%</span>
  #                 <span>Settings</span>
  #                 </a>
  #                 </li>
  #                 <li><a href="javascript:;">Help</a></li>
  #                   <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
  #                     </ul>
  #                     </li>
  #                     </ul>
}