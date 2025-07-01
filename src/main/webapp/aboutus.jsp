
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

                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Core">Core Team</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Collaborator">Key Collaborators Team</a><br><br>
                    <a class="btn btn-general" href="aboutus.jsp?colleagueType=Advisor">Advisors</a><br><br>


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



            }

            //renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, 'colleagueType','${empty param.colleagueType ? 'Core' : param.colleagueType}',null, renderColleagues)
var object1 = {
                content_type: PRODUCT_CONTENT_TYPE_ID,
                'fields.colleagueType': '${empty param.colleagueType ? 'Core' : param.colleagueType}',
                order:'fields.ranking'
            };

            

            

            /*contentfulClient.getEntries(object1)
                    .then(function (entries) {
                        console.log(entries);
                        container.html(renderColleagues(entries.items));
                    })
*/
renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, 'colleagueType','${empty param.colleagueType ? 'Core' : param.colleagueType}','-ranking', renderColleagues)

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
                return  '<p>' + fields.name + '</p>' + renderProductHeader(fields) 
                       
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
                            '<img src="' + image.fields.file.url + '" width="150" height="150" />' +
                            '</a>'
                } else {
                    return ''
                }
            }

        </script>    
    </body>
</html>
