
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
                    <c:choose>
                        <c:when test="${not empty param.type }">

                        </c:when>
                        <c:otherwise>

                            <p>
                                Youngwilders are looking for a Visual Lead to document and share the progress of our youth-led nature recovery projects across England and Wales, and to produce content to engage and empower young people in relation to nature recovery.
                                <br><br>
                                HOW TO APPLY<br><br>
                                To apply for this role please email Noah - noah@youngwilders.uk with a short covering letter (less than one page) explaining why you think you would be a good fit for Youngwilders, and with a link to your portfolio of work. 
                                <br><br>
                                The deadline for applications is the 14th January, and we will be inviting candidates for interviews in the following two weeks. If you have any questions at all please do get in touch. 
                                <br>

                            </p>
                            <div>
                                <div style="background-color: white;width:260px;height:430px;margin-left:30px">

                                    VISUAL LEAD JOB DESCRIPTION
                                </div>
                                <p>VIEW PDF</p>
                            </div>  
                        </c:otherwise>
                    </c:choose>


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

                renderID(contentfulClient, '3PUjMyfRjl2ASZphTKnHf0', $('#right-content'), renderSteward);




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
