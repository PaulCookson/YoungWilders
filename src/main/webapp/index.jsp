
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id='home'>
        <%@include  file="includes/google.jsp" %> 
        <div class="container">
            <div class="row">
        
          <%@include  file="includes/leftnav.jsp" %>
        
        <div id="centre-content" class="col-lg-4 content-first">
            <div id="content">
                    
                    </div>
            
            
        </div>
        <div id='right-content' class="col-lg-6">
            <img class="image-first" src="assets/1.jpg">
            <img class="image-second" src="assets/2.jpg">
            <img class="image-third" src="assets/3.png">
            <img class="image-forth" src="assets/4.png">
            <img class="image-fifth" src="assets/5.png">
            <div style="width:200px;display:inline">
                <img class="image-sixth" src="assets/8.png">
            <img class="image-seventh" src="assets/7.png">
            </div>
            
            <img class="image-eighth" src="assets/6.png">
            
            
        </div>
      </div>
            
            
        </div>    
        
       
         <script>
            
            
            
            
            
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                renderID(contentfulClient, '5H6xbZFo4zJXfhmTIEeyLL',$('#content'), basicRenderer);
                

                renderAssets(contentfulClient,$('#right-content'), renderImages);

            }
            function renderSingleImage(asset, index)
            {
                return '<div class="homeimage image' + index +'">' + renderImage(asset) + '</div>';
                
            }
            function renderImages(assets)
            {
                
                
                return assets.map(renderSingleImage).join();
            
            }

        </script>    
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
    </body>
</html>
