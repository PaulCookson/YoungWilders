
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="programme">
<%@include  file="includes/google.jsp" %> 
         <%@include  file="includes/container.jsp" %>
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content"  class="col-lg-4 content-first">
                    
                    <div id="content">
                    
                    </div>
                    <div class="button_group">
                        <a type="button" class="btn btn-general" href="programme?date=upcoming">Upcoming</a>
                        <a type="button" class="btn btn-general" href="programme?date=past">Past</a>
                    </div>
                </div>
                <div id="right-content" class="col-lg-6">
                    
                    <div id="programmes" class="row">
                        
                        
                    </div>
               
                </div>
            </div>


        </div>    

      

             <script>
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            
           
            
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
                            '<div class="programme-title programme-item-col col-md-6 col-sm-8 col-8" >' + 
                                fields.programmeName + 
                                
                            '</div>' +
                            '<div class="programme-item-col col-md-3  d-sm-none d-none d-md-block" >' +

                                fields.programmeLocation +
                                
                            '</div>' +
                            '<div class="programme-item-col col-md-2 col-sm-3 col-3" >' +
                                     new Date(Date.parse(fields.programmeStartDate)).toLocaleDateString('en-gb')  + 
                                    
                     
                            '</div>' +
                            '<div class="programme-item-col col-md-1 col-sm-1 col-1" >' +
                                   
                                    '<div data-bs-toggle="collapse" class="question collapsed" href="#faq' + index + '"  aria-expanded="false">+</div>' +
                     
                            '</div>' +

                            
                            '<div id="faq' + index + '" class="programme-item-detail row collapse" data-bs-parent=".faq-list" style="margin-top: 10px;">' +

                             '   <div class="col-lg-6">' +
                             
                                 documentToHtmlString(fields.programmeOverview) +

                              
                                '</div>' +
                                '<div class="col-lg-6">' +
                                renderImage(fields.programmeImage) +
                                '</div>' +

                            '</div>' +
                        '</div>' +
                        '</li>'
                
            }
            $(document).ready()
            {


                contentfulClient = getClient(contentful);

                PRODUCT_CONTENT_TYPE_ID = 'programme';

                

                renderID(contentfulClient, '6CwmRW9EJ4HWhVflhk0Iay',$('#content'), basicRenderer);
                var now = new Date();
		var todayUTC = new Date(Date.UTC(now.getFullYear(), now.getMonth(), now.getDate()));
		var gt = todayUTC.toISOString().slice(0, 10);
                //console.debug(todayUTC.toISOString());
                                <c:choose>
                                    <c:when test="${param.date eq 'past'}">
                                        renderContent(contentfulClient,$('#programmes'), PRODUCT_CONTENT_TYPE_ID, "programmeStartDate[lte]",gt,'-fields.programmeStartDate', renderProgrammes)
                                    </c:when>
                                    <c:otherwise>
                                        renderContent(contentfulClient,$('#programmes'), PRODUCT_CONTENT_TYPE_ID, "programmeStartDate[gte]",gt,'-fields.programmeStartDate', renderProgrammes)
                                    </c:otherwise>
                                </c:choose>
                
                
               

                var elements = document.getElementsByClassName("programme-item-detail");
                for (var i = 0; i < elements.length; i++) {
                    elements[i].addEventListener('hidden.bs.collapse', function (element) {
                        
                        var li = $(this).closest("li");
                        
                        li.find('.programme-title').css('font-weight', 'normal');
                        
                    });
                    elements[i].addEventListener('shown.bs.collapse', function (element) {
                        
                        var li = $(this).closest("li");
                        
                        li.find('.programme-title').css('font-weight', 'bold');
                        
                    });
  // do something...
                }               
                
                


            }
            
            </script>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>
