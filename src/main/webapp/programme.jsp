
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="programme">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content"  class="col-lg-4 content-first">
                    
                    <div id="content">
                    
                    </div>
                    <div class="button_group">
                        <a type="button" class="btn btn-general" href="programme.jsp?date=upcoming">Upcoming</a>
                        <a type="button" class="btn btn-general" href="programme.jsp?date=past">Past</a>
                    </div>
                </div>
                <div id="right-content" class="col-lg-6">
                    
                    <div id="programmes">
                        
                        
                    </div>
               
                </div>
            </div>


        </div>    

      

             <script>
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            
            function renderer(entry)
            {
                return documentToHtmlString(entry.fields.pageContent)

            }
            
            function renderProgrammes(programmes) {
                return '' +
                        '<ul class="faq-list" style="list-style-type:none;padding-left: 0">' +
                        programmes.map(renderSingleProgramme).join('\n') +
                        '</ul>';
                
                
                
            }
            function renderSingleProgramme(programme, index)
            {
                var fields = programme.fields
                return '<li class="programme-item">' +
                        '<div class="row">' +
                            '<div class="programme-item-col" style="width:300px;">' + 
                                fields.programmeName + 
                                
                            '</div>' +
                            '<div class="programme-item-col" style="width:240px;">' +

                                fields.programmeLocation +
                                
                            '</div>' +
                            '<div class="programme-item-col" style="width:70px;">' +
                                 '' + new Date(Date.parse(fields.programmeStartDate)).toLocaleDateString('en-gb') +
                                
                            '</div>' +

                            '<div data-bs-toggle="collapse" class="programme-item-col question collapsed" href="#faq' + index + '" style="width:10px" aria-expanded="false">+<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>' +
                            '<div id="faq' + index + '" class="programme-item-detail row collapse" data-bs-parent=".faq-list" style="margin-top: 10px;">' +

                             '   <div class="col-lg-6">' +
                             
                                 documentToHtmlString(fields.programmeOverview) +

                              
                                '</div>' +
                                '<div class="col-lg-6">' +
                                '    <img style="width:100%" src="./assets/programme.png">   ' +
                                '</div>' +

                            '</div>' +
                        '</div>' +
                        '</li>'
                
            }
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'programme';

                container = $('#programmes'); 

                renderID(contentfulClient, '6CwmRW9EJ4HWhVflhk0Iay',$('#content'), renderer);
                var now = new Date();
		var todayUTC = new Date(Date.UTC(now.getFullYear(), now.getMonth(), now.getDate()));
		var gt = todayUTC.toISOString().slice(0, 10);
                //console.debug(todayUTC.toISOString());
                                <c:choose>
                                    <c:when test="${param.date eq 'past'}">
                                        renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, "programmeStartDate[lte]",gt,'fields.programmeStartDate', renderProgrammes)
                                    </c:when>
                                    <c:otherwise>
                                        renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, "programmeStartDate[gte]",gt,'fields.programmeStartDate', renderProgrammes)
                                    </c:otherwise>
                                </c:choose>
                
                

            }
            
            </script>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>
