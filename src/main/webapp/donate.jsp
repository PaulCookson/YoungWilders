<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="scrap">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="full-content" class="col-lg-10">
                    <div id="content">
                        
                    </div>
                    
                    
                    
                    <div class="scrapentry" style="height:300px">
                        <a target="_blank" href="https://youngwilders.enthuse.com/donateonce#!/">Donate Once</a>
                        
                    </div>
                     <div class="scrapentry" style="height:300px">
                        <a target="_blank" href="https://youngwilders.enthuse.com/becomeayoungwilder#!/">Donate Monthly</a>
                        
                    </div>
                    
                    
                </div>
               
            </div>


        </div>    
        <script>
            
            var projects;
            
            
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            let map;
            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                PRODUCT_CONTENT_TYPE_ID = 'project';

                container = $('#projects');




                
                renderID(contentfulClient, '3OhCnFCVCoC8FXADOi2imI',$('#content'), null);
                


            }
            

        </script>    


 <script async
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBxol2BCz3gtSPa1Ig5Zs0sx23kmq2Qfnw&loading=async&callback=initMap">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->



    </body>
</html>
