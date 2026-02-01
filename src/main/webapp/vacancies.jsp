
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="vacancy">
        
         <script id="vacdetail" type="text/>x-handlebars-template">
            
            <div  class="vacancy-item-detail row" data-bs-parent=".faq-list" style="margin-right:20px">
                <div class="col-lg-12">
                             
                                 {{{renderHtml jobDescription}}}
                </div>
                <div class="col-lg-12" style="height:400px;margin-top:20px">
                                <object data="{{{attachment.fields.file.url}}}" type="application/pdf" width="100%" height="100%" ><p>Your browser does not support PDFs. [Download the PDF](https://example.com/test.pdf) .</p> </object>
                                
                                </div>
            </div>
                <%--<div class="col-lg-12" style="height:400px">
                    <object data="' + vacancy.fields.attachment.fields.file.url + '" type="application/pdf" width="100%" height="100%" ><p>Your browser does not support PDFs. [Download the PDF](https://example.com/test.pdf) .</p> </object>'
                                +
                                '</div>' +

                            '</div>' ;
    
    
            <div class="row scrapentry draggable">
                <div class="col-6">{{{renderImages mainMedia}}} </div>
                <div class="col-6">{{{renderHtml mainContent}}}</div>
            </div>--%>
        </script> 
        
<%@include  file="includes/google.jsp" %> 
         <%@include  file="includes/container.jsp" %>
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">

                    </div>


                   <%--<div class="button_group" >
                        
                        <a type="button" class="btn btn-general" href="javascript:renderVacancies()">Vacancies</a>
                        
                        <a type="button" class="btn btn-general" href="javascript:renderStewards()">Wild Stewards</a>

                    </div>     
                   --%>
                </div>
                <div id="right-content" class="col-lg-6">
                     <div class="row">

                        <div id="vacancies" class="col-lg-2" style="margin-top:30px;">
                            <!--<p><a class="link-opacity-100" href="vacancies.jsp?type=other">Pounce Hall</a></p>
                            <p><a class="link-opacity-100" href="vacancies.jsp?type=other">123</a></p>
                            -->
                        </div>
                        <div id="vacancydetail" class="col-lg-10" style="margin-top:30px;">
                            
                            <div>
                                
                                
                            </div>
                            
                        </div>


                    </div>

                </div>
            </div>


        </div>    


        <script>
            var container;

            var contentfulClient;
            var vacancies;
            
            
            function renderStewards()
            {
                contentfulClient = getClient(contentful);

                renderID(contentfulClient, '3PUjMyfRjl2ASZphTKnHf0', $('#right-content'), renderSteward);
                

            }
            
            function renderVacancies()
            {
                PRODUCT_CONTENT_TYPE_ID = 'vacancy';
                renderContent(contentfulClient,$('#vacancies'), PRODUCT_CONTENT_TYPE_ID, null,null,null, renderVacancyList)
                          
            }
            function renderVacancyList(data)
            {
                vacancies = data;
                 return '' +
                        
                        vacancies.map(renderSingleVacancy).join('\n') ;
                        
                
            }
            function renderSingleVacancy(vacancy, index) {
                
                return '<p><a class="link-opacity-100" href="#" onclick="renderDetail(' + index + ');return false;">' + vacancy.fields.jobTitle + '</a></p>';
                
            
            }
             function renderDetail(index)
            {
                
                var fields =vacancies[index].fields;
                
                var images;
        
                if(fields.projectImages && fields.projectImages.map)
                    images = fields.projectImages.map(renderImage).join('<br>');        
                
                
                var html = document.getElementById('vacdetail').innerHTML;

                var template = window.Handlebars.compile(html);
                
                var compiledData = template(fields);
                
                $('#vacancydetail').html(compiledData);
                
                
                
                
                
                
            
                
                
            }
            
            function renderSingleVacancy1(vacancy, index)
            {
                 return '' + '<li>' + 
                    '<div class="row">' +
                            '<div class="vacancy-title vacancy-item-col col-md-8 col-sm-8 col-8" >' + 
                                vacancy.fields.jobTitle + 
                                
                            '</div>' +
                            
                            '<div class="vacancy-item-col col-md-4 col-sm-4 col-4" >' +
                                 '<div class="row">' +
                                    '<div data-bs-toggle="collapse" class="col-md-4 col-sm-4 col-4 question collapsed" href="#faq' + index + '"  aria-expanded="false"><i class="bi bi-chevron-down icon-show"></i></div>' +
                                 '</div>' + 
                            '</div>' +
                            '<div id="faq' + index + '" class="vacancy-item-detail row collapse" data-bs-parent=".faq-list" style="margin-top: 10px;">' +

                             '   <div class="col-lg-12">' +
                             
                                 documentToHtmlString(vacancy.fields.jobDescription) +

                              
                                '</div>' +
                                '<div class="col-lg-12" style="height:400px">' 
                                + '<object data="' + vacancy.fields.attachment.fields.file.url + '" type="application/pdf" width="100%" height="100%" ><p>Your browser does not support PDFs. [Download the PDF](https://example.com/test.pdf) .</p> </object>'
                                +
                                '</div>' +

                            '</div>' +
                        '</div>' +         
                
                
                '</li>';
                
            }
            $(document).ready()
            {
                let options = {
                    renderNode: {
                        'embedded-asset-block': (node) =>
                            image(node)


                    }
                }
                Handlebars.registerHelper('renderHtml', function (value) {
                    return  basicFieldRenderer(value, options);
                });

                contentfulClient = getClient(contentful);

                
                renderID(contentfulClient, '7EeupRioCGgRs6xpCt0wL0', $('#content'), basicRenderer);
                renderVacancies();
<%--
            <c:choose>
                <c:when test="${param.type=='wild steward'}">
                renderID(contentfulClient, '3PUjMyfRjl2ASZphTKnHf0', $('#right-content'), renderSteward);
                </c:when>
                <c:otherwise>
                    renderID(contentfulClient, '5bBjiNvCl5G6YwxffeAYmm', $('#right-content'), renderSteward);

                </c:otherwise>
            </c:choose>

--%>




            }

            function renderSteward(steward) {
                return  documentToHtmlString(steward.fields.jobDescription)
                        + '<div><div style="background-color: white;width:80%;height:430px;margin-left:30px">'
                        + '<object data="' + steward.fields.attachment.fields.file.url + '" type="application/pdf" width="100%" height="100%" ><p>Your browser does not support PDFs. [Download the PDF](https://example.com/test.pdf) .</p> </object>'
                        + '</div></div>';


            }


        </script>    


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>


    </body>
</html>
