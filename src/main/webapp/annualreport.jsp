
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="vacancy">
        <%@include  file="includes/google.jsp" %> 
        <div class="container">
            <div class="row">
        
          <%@include  file="includes/leftnav.jsp" %>
        
        <div id="centre-content" class="col-lg-4 content-first">
            <div id="content">
                
                <div id="content_sub">
                    
                </div>
                    
                <a href="javascript:renderID(contentfulClient, 'WQRV0feebQwFPEzv4WpZs',$('#right-content'), renderReport)">Annual Report 2025</a><br>
                <a href="javascript:renderID(contentfulClient, '4yLvtibGkFZLJK5gfoN9rz',$('#right-content'), renderReport)">Annual Report 2024</a>
                
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

                
                renderID(contentfulClient, 'WQRV0feebQwFPEzv4WpZs',$('#content_sub'), basicRenderer);
                
                renderID(contentfulClient, 'WQRV0feebQwFPEzv4WpZs',$('#right-content'), renderReport);
                




            }
            function renderReport(page) {
                return  '<div><div style="background-color: white;width:80%;height:430px;margin-left:30px;margin-top:30px">'
                        + '<object data="' + page.fields.pageMedia.fields.file.url + '" type="application/pdf" width="100%" height="100%" ><p>Your browser does not support PDFs. [Download the PDF](https://example.com/test.pdf) .</p> </object>'
                        + '</div></div>';


            }
            
            
            
        </script>    
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
    </body>
</html>
