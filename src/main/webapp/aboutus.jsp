
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %> 
        <script nonce="" src="js/aboutus.js"></script>
        
        
        
        
    </head>
    <body id="aboutus">

        <div class="container">
            <div class="row">
                
                    <%@include  file="includes/leftnav.jsp" %>
                
                <div  id="centre-content"  class="col-lg-4 content-first">
                    <div id="content">
                        
                    </div>
                    
                    <div class="button_group" >
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Core">Core Team</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Collaborator">Wild Stewards</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Advisor">Advisors</a><br><br>
</div>

                </div>
                <div id="right-content" class="col-lg-6">
                    <div id="colleagues">

                    </div>
                   
                </div>
            </div>


        </div>    

        

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

        <script>
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'colleague';

                container = $('#colleagues'); 

                renderID(contentfulClient, '48Q8v5h7UAwXnkV0qtbJJ2',$('#content'), basicRenderer);
                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, 'colleagueType','${empty param.colleagueType ? 'Core' : param.colleagueType}','-fields.ranking', renderColleagues)


            }

            
            function renderColleagues(colleagues) {
                return '' +
                        '<div class="row">' +
                        colleagues.map(renderSingleColleague).join('\n') +
                        '</div>'
            }

            function renderSingleColleague(colleague) {
                var fields = colleague.fields
                console.log(fields)
                return '<div class="colleague col-md-6 col-sm-6">' +
                        '<div class="colleague-image">' +
                        renderImage(fields.picture) +
                        '</div>' +
                        '<div class="colleague-details">' +
                        renderColleagueDetails(fields) +
                        '</div>' +
                        '</div>'
            }

            function renderColleagueDetails(fields) {
                return  '<h3>' + fields.name + (fields.pronoun in window?'': ' (' + fields.pronoun + ')')+   '</h3>' + renderProductHeader(fields) 
                       
            }

            function renderProductHeader(fields) {
                return '<div class="colleague-info">' +
                        '<p>' +
                        (fields.background ? documentToHtmlString(fields.background):'')
                        +
                        '</p>' +
                        
                        '</div>'
            }
            
            

            function renderImage(image) {
                if (image && image.fields.file) {
                    return '<img src="' + image.fields.file.url + '"   />' ;
                            
                } else {
                    return '';
                }
            }

        </script>    
    </body>
</html>
