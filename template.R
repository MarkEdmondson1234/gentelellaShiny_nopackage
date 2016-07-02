library(shiny)

headerBoilerPlate <- function(title_tag = "Shiny HTML"){
  
  HTML(sprintf('    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
       <meta charset="utf-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       
       <title>%s</title>
       
       <!-- NProgress -->
       <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
       <!-- iCheck -->
       <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
       <!-- bootstrap-progressbar -->
       <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
       <!-- JQVMap -->
       <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
       
       <!-- Custom Theme Style -->
       <link href="../build/css/custom.min.css" rel="stylesheet">', title_tag))
  
}

header2 <- function(title_tag){
  
  tags$head(
    headContent(),  # this is not allowed
    headerBoilerPlate(),
    bootstrapLib()
  )
  
}

footerBoilerPlate <- function(message = NULL){
  
  if(is.null(message)){
    message <- tagList(p('Gentelella Shiny - Bootstrap Admin Template by', 
                         a(href="https://colorlib.com", 'Colorlib'), 
                         '. Shiny template by ', 
                         a(href="http://markedmondson.me", 'Mark Edmondson')))
  }
  
  HTML(sprintf('
        <!-- footer content -->
        <footer>
          <div class="pull-right">
          %s
          </div>
          <div class="clearfix"></div>
       </footer>
       <!-- /footer content -->
       
       <!-- bootstrap-progressbar -->
       <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
       <!-- Custom Theme Scripts -->
       <script src="../build/js/custom.min.js"></script> 
       ', message))
  
  
}

sideBarBoilerPlate <- function(site_title = a(class="site_title", icon("paw"), span("Shiny HTML")),
                               menuItems = list(
                                 sideBarElement(" Home ",
                                                icon = icon("home"),
                                                list(a(href="index.html", "Dashboard"),
                                                     a(href="index2.html", "Dashboard2"),
                                                     a(href="index3.html", "Dashboard3"))                        
                                                ),
                                 sideBarElement(" Contact ",
                                                icon = icon("envelope"),
                                                list(a(href="http://twitter.com/HoloMarkeD", 
                                                       HTML(paste(icon("twitter"), "@HoloMarkeD"))),
                                                     a(href="http://code.markedmondson.me", 
                                                       HTML(paste(icon("rss"), " Blog"))),
                                                     a(href="https://github.com/MarkEdmondson1234/gentelellaShiny", 
                                                       HTML(paste(icon("github"), " Github"))))                        
                                 ),
                                 sideBarElement(column(width = 12, googleAuthR::googleAuthUI("auth"),
                                                       icon = NULL)
                               ))){
  
  withTags({
    div(class="col-md-3 left_col",
        div(class="left_col scroll-view",
          div(class="navbar nav_title", style="border: 0;",
             site_title
          ),
          div(class = "clearfix"),
          uiOutput("profile"),
          br(),
          div(id="sidebar-menu", class="main_menu_side hidden-print main_menu",
            div(class = "menu_section",
                h3(""),
                ul(class = "nav side-menu",
                   tagList(lapply(menuItems, li))
                   )
                )
          )
          
          
        ))
  })
}

#' sideBarLinks
#' 
#' Things put in li()
#' 
#' Use HTML() wrapped around icon() if neccessary
sideBarElement <- function(element,
                           icon = NULL,
                           nested_element=NULL                        
                           ){
  
  tagList(
    tags$a(icon, element, if(!is.null(nested_element)) span(class="fa fa-chevron-down")),
    tags$ul(class="nav child_menu",
      tagList(lapply(nested_element, tags$li)
    )
  ))
  
}
  
#' Top Navbar
navbarBoilerPlate <- function(){
    
  withTags({
    div(class="top_nav",
        div(class="nav_menu",
            nav(
              div(class="nav toggle",
                  a(id="menu_toggle", icon("bars"))
              ),
              uiOutput("profile_nav")
              
            )
        ) 
    )
    
  })
  
}
  # <div class="col-md-3 left_col">
  #   <div class="left_col scroll-view">
  #     <div class="navbar nav_title" style="border: 0;">
  #       <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Shiny HTML Template</span></a>
  #         </div>
  #         <div class="clearfix"></div>
  #           {{ profile }}
  #         <!-- /menu profile quick info -->
  #           <br />
  #           <!-- sidebar menu -->
  #           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  #             <div class="menu_section">
  #               <h3>General</h3>
  #               <ul class="nav side-menu">
  #                 <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
  #                   <ul class="nav child_menu">
  #                     <li><a href="index.html">Dashboard</a></li>
  #                       <li><a href="index2.html">Dashboard2</a></li>
  #                         <li><a href="index3.html">Dashboard3</a></li>
  #                           </ul>
  #                           </li>
  #                           <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
  #                             <ul class="nav child_menu">
  #                               <li><a href="tables.html">Tables</a></li>
  #                                 <li><a href="tables_dynamic.html">Table Dynamic</a></li>
  #                                   </ul>
  #                                   </li>
  #                                   </ul>
  #                                   </div>
  #                                   <div class="menu_section">
  #                                     <h3>Resources</h3>
  #                                     <ul class="nav side-menu">
  #                                       <li><a><i class="fa fa-envelope"></i> Contact <span class="fa fa-chevron-down"></span></a>
  #                                         <ul class="nav child_menu">
  #                                           <li><a href="http://twitter.com/HoloMarkeD"><i class="fa fa-twitter"></i>@HoloMarkeD</a></li>
  #                                             <li><a href="http://code.markedmondson.me"><i class="fa fa-rss"></i> Blog</a></li>
  #                                               <li><a href="https://dk.linkedin.com/in/markpeteredmondson"><i class="fa fa-linkedin"></i> LinkedIn</a></li>
  #                                                 <li><a href="https://github.com/MarkEdmondson1234/gentelellaShiny"><i class="fa fa-github"></i>Github</a></li>
  #                                                   </ul>
  #                                                   </li>
  #                                                   <li>{{ googleLogin }}</li>
  #                                                   </ul>
  #                                                   </div>
  #                                                   
  #                                                   </div>
  #                                                   <!-- /sidebar menu -->
  #                                                   </div>
  #                                                   </div>
  
  # <!-- top navigation -->
  #   <div class="top_nav">
  #     <div class="nav_menu">
  #       <nav>
  #       <div class="nav toggle">
  #         <a id="menu_toggle"><i class="fa fa-bars"></i></a>
  #           </div>
  #           
  #           {{ profile_nav }}
  #         
  #         </nav>
  #           </div>
  #           </div>
  #           <!-- /top navigation -->