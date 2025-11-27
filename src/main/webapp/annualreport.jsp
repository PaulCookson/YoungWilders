
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="vacancy">
        
        <div class="container">
            <div class="row">
        
          <%@include  file="includes/leftnav.jsp" %>
        
        <div id="centre-content" class="col-lg-4 content-first">
            <div id="content">
                
            </div>
                  
           
        </div>
        <div id="right-content" class="col-lg-6">
            
            
            
        </div>
      </div>
            
            
        </div>    
        
       <script>
            var container;
            
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                
                renderID(contentfulClient, 'WQRV0feebQwFPEzv4WpZs',$('#content'), basicRenderer);
                


            }

            
            
            
        </script>    
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
    </body>
</html>
