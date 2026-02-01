
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %> 
        <script nonce="" src="js/aboutus.js"></script>
        
        
        
        
    </head>
    <body id="aboutus">
        <%@include  file="includes/google.jsp" %> 
        <%@include  file="includes/container.jsp" %>
        
            <div class="row">
                
                    <%@include  file="includes/leftnav.jsp" %>
                
                <div  id="centre-content"  class="col-lg-4 content-first">
                    <div id="content">
                        
                    </div>
                    
                    <div class="button_group" >
                    <a type="button" class="btn btn-general" href="aboutus?colleagueType=Core">Core Team</a>
                    <a type="button" class="btn btn-general" href="aboutus?colleagueType=Collaborator">Wild Stewards</a>
                    <a type="button" class="btn btn-general" href="aboutus?colleagueType=Advisor">Advisors</a>
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


                contentfulClient = getClient(contentful);

                PRODUCT_CONTENT_TYPE_ID = 'colleague';



                renderID(contentfulClient, '48Q8v5h7UAwXnkV0qtbJJ2',$('#content'), basicRenderer);
                renderContent(contentfulClient,$('#colleagues'), PRODUCT_CONTENT_TYPE_ID, 'colleagueType','${empty param.colleagueType ? 'Core' : param.colleagueType}','fields.ranking', renderColleagues)


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
            
            

            

        </script>    
    </body>
</html>
