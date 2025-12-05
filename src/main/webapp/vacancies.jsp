
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="vacancy">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-lg-4 content-first">
                    <div id="content">

                    </div>


                    <div class="button_group" >
                        <a type="button" class="btn btn-general" href="vacancies.jsp">Visual Lead</a>
                        <a type="button" class="btn btn-general" href="vacancies.jsp?type=wild%20steward">Wild Stewards</a>

                    </div>     

                </div>
                <div id="right-content" class="col-lg-6">
                    

                </div>
            </div>


        </div>    


        <script>
            var container;

            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = getClient(contentful);


                renderID(contentfulClient, '7EeupRioCGgRs6xpCt0wL0', $('#content'), basicRenderer);

            <c:choose>
                <c:when test="${param.type=='wild steward'}">
                renderID(contentfulClient, '3PUjMyfRjl2ASZphTKnHf0', $('#right-content'), renderSteward);
                </c:when>
                <c:otherwise>
                    renderID(contentfulClient, '5bBjiNvCl5G6YwxffeAYmm', $('#right-content'), renderSteward);

                </c:otherwise>
            </c:choose>






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
