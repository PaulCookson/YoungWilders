
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include  file="includes/head.jsp" %>
    </head>
    <body id="proj">

        <div class="container">
            <div class="row">

                <%@include  file="includes/leftnav.jsp" %>

                <div id="centre-content" class="col-md-4 content-first">
                    <div id="content">
                    
                    </div>
                    <div class="button_group" >
                        <a type="button" class="btn btn-general" href="projects.jsp">List View</a>
                        <a type="button" class="btn btn-general" href="projectmap.jsp">Map View</a>

                    </div>           
                </div>
                <div id="right-content" class="col-md-6">

                    <div class="row">

                        <div id="projects" class="col-md-4" style="margin-top:30px;">
                            <!--<p><a class="link-opacity-100" href="vacancies.jsp?type=other">Pounce Hall</a></p>
                            <p><a class="link-opacity-100" href="vacancies.jsp?type=other">123</a></p>
                            -->
                        </div>
                        <div id="projectdetail" class="col-md-8" style="margin-top:30px;">
                            
                            <div>
                                
                                
                            </div>
                            
                        </div>


                    </div>

                </div>
            </div>


        </div>    
        <script>
            
            var projects;
            
            function renderDetail(index)
            {
                
                var fields =projects[index].fields;
                var images = fields.projectImages.map(renderImage).join('<br>');        
                
                $('#projectdetail').html('<div>' + '<img src="' + fields.shapeFile.fields.file.url + '" />' +
                '<table><tr><td width="40%"><p>PROJECT START<br>' + new Date(Date.parse(fields.projectDate)).getFullYear() +'<br><br>'
                 + 'ACREAGE<br>' +  fields.acreage + '<br><br>WILD STEWARDS<br>' 
                 + fields.wildStewards + '<br><br>ECOLOGICAL WORK</p>' +
                documentToHtmlString(fields.ecologicalWork)  +
                '</td><td>' + fields.location + '<br><br><br>' +
                documentToHtmlString(fields.factSheet)  +
                '</td></tr></table>' 
                + '<div id="projectImages">' + images + '</div>'
                + '</div>');
                
            }
            function renderer(entry)
            {

                return documentToHtmlString(entry.fields.pageContent)

            }
            function renderProjects(data)
            {
                projects = data;
                return data.map(renderSingleProject).join('\n');
                        

            }
            function renderSingleProject(project, index) {
                var fields = project.fields;
                console.log(fields)
                return '<p><a class="link-opacity-100" href="#" onclick="renderDetail(' + index + ');return false;">' + fields.projectName + '</a></p>';
                
            
            }
            function renderImage(image) {
                if (image && image.fields.file) {
                    return '<img  src="' + image.fields.file.url + '" />' ;
                } else {
                    return '';
                }
            }
            function renderProjectDetails(fields) {
                return  '<p>' + fields.projectName + '</p>';

            }
            var container;
            var PRODUCT_CONTENT_TYPE_ID;
            var contentfulClient;
            $(document).ready()
            {


                contentfulClient = contentful.createClient({
                    accessToken: 'ytygcE-zI6VEYycBoRzvYvtXW_VcXAYfldZSnmDFNhs',
                    space: 'y0hkcnou78kd'
                });

                PRODUCT_CONTENT_TYPE_ID = 'project';

                container = $('#projects');




                renderContent(contentfulClient, PRODUCT_CONTENT_TYPE_ID, null, null, null, renderProjects)
                renderID(contentfulClient, '74IVrpw1ZyaXW9QmJ5DgtC',$('#content'), renderer);
                


            }


        </script>    




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->



    </body>
</html>
