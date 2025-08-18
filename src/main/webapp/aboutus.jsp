
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
                
                <div  id="centre-content"  class="col-md-4 content-first">
                    <p>Youngwilders started in 2020 as the passion project of a group of friends hellbent on helping nature recovery.<br><br></p>
                    <div class="button_group" >
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Core">Core Team</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Collaborator">Key Collaborators Team</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Advisor">Advisors</a><br><br>
</div>

                </div>
                <div id="right-content" class="col-md-6">
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

                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, 'colleagueType','${empty param.colleagueType ? 'Core' : param.colleagueType}','-fields.ranking', renderColleagues)


            }

            
            function renderColleagues(colleagues) {
                return '' +
                        '<div class="colleagues row">' +
                        colleagues.map(renderSingleColleague).join('\n') +
                        '</div>'
            }

            function renderSingleColleague(colleague) {
                var fields = colleague.fields
                console.log(fields)
                return '<div class="colleague col">' +
                        '<div class="colleague-image">' +
                        renderImage(fields.picture) +
                        '</div>' +
                        '<div class="colleague-details">' +
                        renderColleagueDetails(fields) +
                        '</div>' +
                        '</div>'
            }

            function renderColleagueDetails(fields) {
                return  '<h3>' + fields.name + '</h3>' + renderProductHeader(fields) 
                       
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
                    return '<a href="product/' + 'slug' + '">' +
                            '<img src="' + image.fields.file.url + '" width="150"  />' +
                            '</a>'
                } else {
                    return ''
                }
            }

        </script>    
    </body>
</html>
