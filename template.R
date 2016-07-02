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

footerBoilerPlate <- function(message = 'Gentelella Shiny - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>'){
  
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