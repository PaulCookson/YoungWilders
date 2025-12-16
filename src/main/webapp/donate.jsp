<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="scrap">
        <%@include  file="includes/google.jsp" %> 
        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="full-content" class="col-lg-10">
                    <div id="content">

                    </div>


                    <div class="row">
                        <div style="width:400px;height:598px;background-image:url(assets/images/donate1.jpg);background-repeat:no-repeat;
   background-size:contain;">
                            <div class="scrapentry" style="height:300px">
                                <a target="_blank" href="https://youngwilders.enthuse.com/donateonce#!/">Donate Once</a>

                        </div>

                        </div>


                        <div style="width:400px;height:598px;background-image:url(assets/images/donate2.jpg);background-repeat:no-repeat;
   background-postion:center;">
                            
                    <div class="scrapentry" style="height:300px">
                        <a target="_blank" href="https://youngwilders.enthuse.com/becomeayoungwilder#!/">Donate Monthly</a>

                    </div>
                        </div>


                    </div>
                    


                </div>

            </div>


        </div>    
        <script>

            var projects;


            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;

            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                PRODUCT_CONTENT_TYPE_ID = 'project';

                container = $('#projects');





                renderID(contentfulClient, '3OhCnFCVCoC8FXADOi2imI', $('#content'), basicRenderer);



            }


        </script>    



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->



    </body>
</html>
