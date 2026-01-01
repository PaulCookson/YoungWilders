
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

                    </div>


                    <div class="button_group" >
                        
                        <a type="button" class="btn btn-general" href="javascript:renderVacancies()">Vacancies</a>
                        
                        <a type="button" class="btn btn-general" href="javascript:renderStewards()">Wild Stewards</a>

                    </div>     

                </div>
                <div id="right-content" class="col-lg-6">
                    

                </div>
            </div>


        </div>    


        <script>
            var container;

            var contentfulClient;
            
            function renderStewards()
            {
                contentfulClient = getClient(contentful);

                renderID(contentfulClient, '3PUjMyfRjl2ASZphTKnHf0', $('#right-content'), renderSteward);
                

            }
            
            function renderVacancies()
            {
                PRODUCT_CONTENT_TYPE_ID = 'vacancy';
                renderContent(contentfulClient,$('#right-content'), PRODUCT_CONTENT_TYPE_ID, null,null,null, renderVacancyList)
                          
            }
            function renderVacancyList(vacancies)
            {
                 return '' +
                        '<ul class="faq-list" style="list-style-type:none;padding-left: 0">' +
                        vacancies.map(renderSingleVacancy).join('\n') +
                        '</ul>';
                
            }
            function renderSingleVacancy(vacancy, index)
            {
                 return '' + '<li>' + 
                    '<div class="row">' +
                            '<div class="vacancy-title vacancy-item-col col-md-8 col-sm-8 col-8" >' + 
                                vacancy.fields.jobTitle + 
                                
                            '</div>' +
                            
                            '<div class="vacancy-item-col col-md-4 col-sm-4 col-4" >' +
                                 '<div class="row">' +
                                    '<div data-bs-toggle="collapse" class="col-md-4 col-sm-4 col-4 question collapsed" href="#faq' + index + '"  aria-expanded="false">+<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>' +
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
                

                contentfulClient = getClient(contentful);

                
                renderID(contentfulClient, '7EeupRioCGgRs6xpCt0wL0', $('#content'), basicRenderer);
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
